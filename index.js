const express = require('express'),
    app = express(),
    PORT = process.env.PORT || 3000,
    cors = require("cors")
    router = require("./routers/index"),
    errorHanding = require("./middlewares/errorHanding")
require('dotenv').config()

app.use(express.json({
    strict : false
}))
app.use(cors())
//Ini router Utama
app.use('/api/v1', router);
//Ini buat error Handingling
app.use(errorHanding);

app.use("*", (req, res)=>{
    return res.status(404).json({
        error: "End Poinst is Not Register Not Found 404"
})
})

app.listen(PORT, ()=>{
    console.log(`Server is Running at PORT ${PORT}`)
})