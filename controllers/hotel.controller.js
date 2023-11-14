const {hotel} = require("../models")

module.exports={
    create: async(req, res, next)=>{
        try {
            const {title, deskripsi, linkmap, alamat, nohp, harga_min, harga_max} = req.body
            const newHotel = await hotel.create({
                data : {
                    title,
                    deskripsi,
                    linkmap,
                    alamat,
                    nohp,
                    harga_min,
                    harga_max,
                    
                }
            })

            } catch (error) {
            return next(error)
        }
    }
}