const express = require("express");
const app = express();
const path = require("path");

app.listen(3000,function(){
    console.log("Servidor listo");
});

app.use(express.static(path.resolve(__dirname,"./public")));

app.get("/",(req,res) => {
    res.sendFile(path.resolve(__dirname,"./views/home.html"));
});

app.get("/productDetail",(req,res) => {
    res.sendFile(path.resolve(__dirname,"./views/productDetail.html"));
});