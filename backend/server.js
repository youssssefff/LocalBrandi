const express = require("express");
const app = express();

app.use(express.json())

app.use(express.urlencoded({ extended: true }))

app.get("/", (req,res) =>{
    res.json({message:"hello"})
})

const productRouter = require('./routes/productRouter.js');
app.use('/api/products', productRouter);

//port
const userRouter = require('./routes/userRouter.js');
app.use('/api/users',userRouter);

const PORT = process.env.PORT || 8080

//server
app.listen(PORT, () => {
    console.log(`server is running on port ${PORT}`)
})