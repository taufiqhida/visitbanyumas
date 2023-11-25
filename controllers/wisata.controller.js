const {wisata} = require("../models")

module.exports={
    create: async(req, res, next)=>{
        try {
            const {title, deskripsi, linkmap, alamat, nohp, harga_min, harga_max, kecamatanId} = req.body
            const newWisata = await wisata.create({
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
                newWisata
            })
            } catch (error) {
            return next(error)
        }
    },
    getwisataAll: async(req, res, next)=>{
        try {
            const getAllwisata = await wisata.findMany({
                skip: 0,
                take: 10
            });
            return res.status(200).json({
                getAllwisata
            })
        } catch (error) {
            return next(error)
        }
    },
    getwisata: async(req, res, next)=>{
        try {
          const getwisata = await wisata.findFirst({
            where:{
                id: parseInt(req.params.id)
            }
          })
          
          return res.status(200).json({
            getwisata
          })
        } catch (error) {
            return next(200)
        }
    },
    updatewisata : async(req, res, next) =>{
        try {
            const {title, deskripsi, linkmap, alamat, nohp, harga_min, harga_max, kecamatanId} = req.body
            const updatewisata = await wisata.update({
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
                updatewisata
              })

        } catch (error) {
            
        }
    },
    destroywisata : async(req, res, next)=>{
        try {
            const hpswisata = await ulasan.delete({
                where: {
                    id: parseInt(req.params.id)
                }
            })

            return res.status(200).json({
                hpswisata
            })
        } catch (error) {
            return next(error)
        }
    }
}