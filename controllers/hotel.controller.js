const {hotel, image} = require("../models"),
    multer = require('multer'),
    path = require('path'),
    utils= require("../utils")

function generateFilter(props) {
    let { allowedMimeTypes } = props;
    return multer({
        fileFilter: (req, file, callback) => {
            if (!allowedMimeTypes.includes(file.mimetype)) {
                const err = new Error(`Only ${allowedMimeTypes.join(', ')} allowed to upload!`);
                return callback(err, false);
            }
            callback(null, true);
        },
        onError: (err, next) => {
            next(err);
        }
    });
}

module.exports={
    upload: generateFilter({
        allowedMimeTypes: ['image/png', 'image/jpeg']
    }),
    create: async(req, res, next)=>{
        try {
            const {title, deskripsi, linkmap, alamat, nohp, harga_min, harga_max} = req.body

            const uploadFiles = async (files, hotelId, nama) => {
                try {
                  const gambarPromises = files.map(async (file) => {
                    let strFile = file.buffer.toString("base64");

                    let { url, fileId } = await utils.imageKit.upload({
                      fileName: Date.now() + path.extname(file.originalname),
                      file: strFile,
                    });

                    const images = await image.create({
                      data: {
                        idImagekit: fileId,
                        nama: nama + path.extname(file.originalname),
                        url,
                        hotelId: hotelId,
                      },
                    });

            return images;
          });

          return Promise.all(gambarPromises);
        } catch (err) {
          throw err;
        }
      };
        const nameSlug = await utils.createSlug(title)

            const newHotel = await hotel.create({
                data : {
                    title: title,
                    deskripsi : deskripsi,
                    linkmap: linkmap,
                    alamat: alamat,
                    nohp:nohp,
                    harga_min : harga_min,
                    harga_max: harga_max,
                    kecamatanId : parseInt(req.body.kecamatanId),
                    slug : nameSlug,
                    image: images
                }
            })

            uploadFiles(req.files, newHotel.id, newHotel.title)

            res.status(200).json({
                newHotel
            })
            } catch (error) {

            return next(error)
        }
    },
    getHotelAll: async(req, res, next)=>{
        try {
            let { page = 1, limit = 10, search, kecamatan, popular,  latest } = req.query
            let skip = ( page - 1 ) * limit
            let whereCondition = {}
            if (search) {
                whereCondition.OR = [
                  { title: { contains: search } },
                ]
            }
            if (kecamatan) {
                const kecamatans = Array.isArray(kecamatan) ? kecamatan : [kecamatan]
                whereCondition = {
                    courseCategory: {
                        slug: {
                            in: kecamatans
                        }
                    }
                }
            }
            let orderByCondition = []

            if(latest) {
                orderByCondition = [
                    {
                        createdAt: 'desc'
                    }
                ]
            }
            if(popular) {
                orderByCondition = [
                    {
                        taken: 'desc'
                    }
                ]
            }



            const getAllHotel = await hotel.findMany({
                take: parseInt(limit),
                skip: skip,
                where: whereCondition,
                data,
                orderBy: orderByCondition,
            });
            const resultCount = await hotel.count({ where: whereCondition })
            const totalPage = Math.ceil(resultCount / limit)
            let message = "Berhasil mengambil data hotel"

            if (search) {
                message += ` berdasarkan kata kunci '${search}'`
            }

            if (kecamatan) {
                message += ` berdasarkan kategori '${kecamatan}'`
            }
            if (popular) {
                message += ` berdasarkan popular`
            }

            if (latest) {
                message += ` berdasarkan terbaru`
            }

            if (resultCount === 0) {
                return res.status(404).json("Tidak ada data course")
            }

            const data =  getAllHotel.map((hotel)=>{
                return{
                    id: hotel.id,
                    title : hotel.title,
                    slug: hotel.slug
                }
            })

            return res.status(200).json((
                message,
                data,
                {
                    currentPage: parseInt(page),
                    totalPage: totalPage,
                    totalData: resultCount,

                }
            ))
        } catch (error) {
            return next(error)
        }
    },
    getHotel: async(req, res, next)=>{
        try {
          const getHotel = await hotel.findFirst({
            where:{
                id: parseInt(req.params.id)
            }
          })
          
          return res.status(200).json({
            getHotel
          })
        } catch (error) {
            return next(200)
        }
    },
    updateHotel : async(req, res, next) =>{
        try {
            const {title, deskripsi, linkmap, alamat, nohp, harga_min, harga_max, kecamatanId} = req.body
                    const nameSlug = await utils.createSlug(title)
            const updateHotel = await hotel.update({
                where:{
                    id: parseInt(req.params.id)
                },
                data:{
                    title,
                    deskripsi,
                    linkmap,
                    alamat,
                    nohp,
                    harga_min,
                    harga_max,
                    kecamatanId,
                    slug : req.body.title.replace(/\s+/g, "-"),
                }
            })
            return res.status(200).json({
                updateHotel
              })
        } catch (error) {
            
        }
    },
    destroyHotel : async(req, res, next)=>{
            console.log(req.params)
        try {
             const getById = await  hotel.findUnique({
                 where:{
                    id: parseInt(req.params.id)
                 }
             })
            if(!getById){
                 return res.status(404).json("Hotel tidak ditemukkan")
            }
            await hotel.delete({
                where: {
                    id: parseInt(req.params.id)
                }
            })
        return res.status(200).json("Hotel berhasil dihapus")
        } catch (error) {
            return next(error)
        }
    }
}


async function uploadFiles(files, hotelId, hotelTitle) {
    const uploadedImages = [];

    for (const file of files) {
        try {
            let strFile = file.buffer.toString("base64");

            let { url, fileId } = await utils.imageKit.upload({
                fileName: Date.now() + path.extname(file.originalname),
                file: strFile,
            });

            const imageRecord = await image.create({
                data: {
                    idImagekit: fileId,
                    nama: hotelTitle + path.extname(file.originalname),
                    url,
                    hotelId: hotelId,
                },
            });

            uploadedImages.push(imageRecord);
        } catch (err) {
            throw err;
        }
    }

    return uploadedImages;
}
