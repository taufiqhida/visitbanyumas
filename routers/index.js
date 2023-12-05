const express = require('express');
const router = express.Router();

const adminRouter = require('./admin.router');
const ulasanRouter = require('./ulasan.router');
const kecamatanRouter = require('./kecamatan.router');
const hotelRouter = require('./hotel.router');

router.use("/admin", adminRouter)
router.use("/ulasan", ulasanRouter)
router.use("/kecamatan", kecamatanRouter)
router.use("/hotel", hotelRouter)



module.exports=router