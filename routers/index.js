const express = require('express'),
    router = express.Router(),
    adminRouter = require('./admin.router'),
    ulasanRouter = require("./ulasan.router"),
    kecamatanRouter = require("./kecamatan.router"),
    hotelRouter = require("./hotel.router")

router.use("/admin", adminRouter)
router.use("/ulasan", ulasanRouter)
router.use("/kecamatan", kecamatanRouter)
router.use("/hotel", hotelRouter)

module.exports=router