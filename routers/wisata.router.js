const express = require("express"),
    router = express.Router(),
    controller = require("../controllers/wisata.controller")

router.post("/create", controller.create)
router.post("/update/:id", controller.updatewisata)
router.get("/get/:id", controller.getwisata)
router.delete("/:id", controller.destroywisata)
router.get("/", controller.getwisataAll)

module.exports=router