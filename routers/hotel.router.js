const express = require("express"),
    router = express.Router(),
    controller = require("../controllers/hotel.controller")

router.post("/create",controller.upload.single('image'), controller.create)
router.post("/update/:id", controller.updateHotel)
router.get("/get/:id", controller.getHotel)
router.delete("/:id", controller.destroyHotel)
router.get("/", controller.getHotelAll)

module.exports=router
