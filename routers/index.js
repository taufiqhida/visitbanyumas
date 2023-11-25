const express = require('express'),
    router = express.Router(),
    adminRouter = require('./admin.router'),
    ulasanRouter = require("./ulasan.router"),
    kecamatanRouter = require("./kecamatan.router")

router.use("/admin", adminRouter)
router.use("/ulasan", ulasanRouter)
router.use("/kecamatan", kecamatanRouter)

module.exports=router