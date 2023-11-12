const express = require('express'),
    router = express.Router(),
    adminRouter = require('./admin.router'),
    ulasanRouter = require("./ulasan.router")

router.use("/admin", adminRouter)
router.use("/ulasan", ulasanRouter)

module.exports=router