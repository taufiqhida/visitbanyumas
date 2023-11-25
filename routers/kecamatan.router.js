const express = require("express"),
    router = express.Router(),
    controller = require("../controllers/kecamatan.controller")

router.post("/create", controller.create)
router.post("/update/:id", controller.update)
router.get("/get/:id", controller.getKecamatan)
router.post("/:id", controller.destroy)
// router.get("/", controller.showAll)

module.exports=router