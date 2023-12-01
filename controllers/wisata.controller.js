const {wisata, image} = require("../models"),
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

            const uploadFiles = async (files, wisataId, nama) => {
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
                        wisataId: wisataId,
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

            const newHotel = await wisata.create({
                data : {
                    title: title,
                    deskripsi : deskripsi,
                    linkmap: linkmap,
                    alamat: alamat,
                    nohp:nohp,
                    harga_min : harga_min,
                    harga_max: harga_max,
                    kecamatanId : parseInt(req.body.kecamatanId),
                    slug : nameSlug
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
    getWisataAll: async(req, res, next)=>{
        try {
            const getAllHotel = await wisata.findMany({
                skip: 0,
                take: 10
            });
            return res.status(200).json({
                getAllHotel
            })
        } catch (error) {
            return next(error)
        }
    },
    getHotel: async(req, res, next)=>{
        try {
          const getHotel = await wisata.findFirst({
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
    updateWisata : async(req, res, next) =>{
        try {
            const {title, deskripsi, linkmap, alamat, nohp, harga_min, harga_max, kecamatanId} = req.body
                    const nameSlug = await utils.createSlug(title)
            const updateHotel = await wisata.update({
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
                    slug : nameSlug
                }
            })
            return res.status(200).json({
                updateHotel
              })
        } catch (error) {

        }
    },
    destroyWisata : async(req, res, next)=>{
            console.log(req.params)
        try {
             const getById = await  wisata.findUnique({
                 where:{
                    id: parseInt(req.params.id)
                 }
             })
            if(!getById){
                 return res.status(404).json("Hotel tidak ditemukkan")
            }
            await wisata.delete({
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