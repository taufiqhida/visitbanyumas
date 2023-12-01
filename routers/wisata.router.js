const express = require("express"),
    router = express.Router(),
    controller = require("../controllers/wisata.controller")

router.post("/create", controller.create)
router.post("/update/:id", controller.updateWisata)
router.get("/get/:id", controller.getHotel)
router.delete("/:id", controller.destroyWisata)
router.get("/", controller.getWisataAll)

module.exports=router