const {hotel} = require("../models")

module.exports={
    create: async(req, res, next)=>{
        try {
            const {title, deskripsi, linkmap, alamat, nohp, harga_min, harga_max, kecamatanId} = req.body
            const newHotel = await hotel.create({
                data : {
                    title,
                    deskripsi,
                    linkmap,
                    alamat,
                    nohp,
                    harga_min,
                    harga_max,
                    kecamatanId,
                    slug : req.body.title.replace(/\s+/g, "-")
                }
            })
            res.status(200).json({
                newHotel
            })
            } catch (error) {
            return next(error)
        }
    },
    getHotelAll: async(req, res, next)=>{
        try {
            const getAllHotel = await hotel.findMany({
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
        try {
            const hpsHotel = await ulasan.delete({
                where: {
                    id: parseInt(req.params.id)
                }
            })

            return res.status(200).json({
                hpsHotel
            })
        } catch (error) {
            return next(error)
        }
    }
}