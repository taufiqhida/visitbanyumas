const {kecamatan} = require("../models")

module.exports = {
    create: async (req, res, next)=>{
        try {
            const data = await kecamatan.create({
                data : {
                    nama : req.body.nama,
                    slug: req.body.title.replace(/\s+/g, "-"),
                }
            })

            return res.status(201).json({
                data : data
            })
        }catch (error){
            next(error)
        }
    },
    getKecamatan: async (req, res, next)=>{
        try {
            const data = await kecamatan.findFirst({
                where: {
                    id : parseInt(req.params.id)
                }
            })
        }catch (error){
            next(error)
        }
    },
    update: async (req, res, next)=>{
        try{
            const data = await kecamatan.update({
                where: {
                    id : parseInt(req.params.id)
                },
                data:{
                    nama : req.body.nama,
                    slug: req.body.title.replace(/\s+/g, "-"),
                }
            })

            return res.status(200).json({
                data
            })
        }catch(error){
            next(error)
        }
    },
    destroy: async(req, res, next)=>{
        try {
            const data = await kecamatan.delete({
                where : {
                    id : parseInt(req.params.id)
                }
            })

            return res.status(200).json({
                data
            })
        } catch (error) {
            return next(error)
        }
    }
}