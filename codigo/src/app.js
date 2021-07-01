const express = require("express");
const app = express();
const path = require("path");
const PORT = process.env.PORT || 3000;

app.set("view engine","ejs")

app.listen(PORT,function(){
    console.log("Servidor listo");
});

app.use(express.static(path.resolve(__dirname,"../public")));

app.post('/home', (req, res) => {
    console.log(req.body)
    res.render('./home.html', { root: 'views'})
});

app.get("/productCart",(req,res) => {
    res.render(path.resolve(__dirname,"./views/products/productCart.ejs"),{title:"Carrito de compras"});
});
app.get("/register",(req,res) => {
    res.render(path.resolve(__dirname,"./views/users/register.ejs"),{title:"Registro"});
});
app.get("/login",(req,res) => {
    res.render(path.resolve(__dirname,"./views/users/login.ejs"),{title:"Inicia Sesión"});
});
app.get("/",(req,res) => {
    res.render(path.resolve(__dirname,"./views/home.ejs"),{title:"Inicio"});
});

app.get("/productDetail",(req,res) => {
    res.render(path.resolve(__dirname,"./views/products/productDetail.ejs"),{title:"Detalle de producto"});
});