const express = require("express"),
    router = express.Router(),
    controller = require("../controllers/ulasan.controller")

router.post("/create", controller.create)
router.post("/update/:id", controller.update)
router.get("/get/:id", controller.getUlasan)
router.get("/", controller.showAll)
router.post("/:id", controller.destroy)

module.exports=router