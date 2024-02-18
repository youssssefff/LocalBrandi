const db = require('../models')

// image Upload
//const multer = require('multer')
//const path = require('path')


// create main Model
const Product = db.products

// main work

// 1. create product

const addProduct = async (req, res) => {

    let info = {
        image: req.file.path,
        title: req.body.title,
        price: req.body.price,
        description: req.body.description,
        published: req.body.published ? req.body.published : false
    }

    const product = await Product.create(info)
    res.status(200).send(product)
    console.log(product)

}
// 2. get all products

const getAllProducts = async (req, res) => {
    let products = await Product.findAll({})
    console.log(products);
    res.status(200).send(products)
}

// 3. get single product

const getOneProduct = async (req, res) => {

    let id = req.params.id
    let product = await Product.findOne({ where: { id: id }})
    res.status(200).send(product)

}

// 4. update Product

const updateProduct = async (req, res) => {

    let id = req.params.id

    const product = await Product.update(req.body, { where: { id: id }})

    res.status(200).send(product)
   

}
// 5. delete product by id
const deleteProduct = async (req, res) => {

    let id = req.params.id
    
    await Product.destroy({ where: { id: id }} )

    res.status(200).send('Product is deleted !')

}
const getProductReviews =  async (req, res) => {

    const id = req.params.id

    const data = await Product.findOne({
        include: [{
            model: Review,
            as: 'review'
        }],
        where: { id: id }
    })

    res.status(200).send(data)

}
///9. 
const getProductWhere = async (req, res) => {
    try {
        // Extract filter parameters from the request query
        const { published, category, gender, bestSeller, newArrival } = req.query;

        // Construct the where clause based on the provided filters
        const whereClause = {};
        if (category) {
            whereClause.category = category;
        }
        if (gender) {
            whereClause.gender = gender;
        }
        if (bestSeller !== undefined) {
            whereClause.bestSeller = bestSeller === 'true';
        }
        if (newArrival !== undefined) {
            whereClause.newArrival = newArrival === 'true';
        }

        // Find products based on the constructed where clause
        const products = await Product.findAll({
            where: whereClause,
            include: [
                {
                    model: db.ProductImage,
                    as: 'images',
                },
            ],
        });

        res.status(200).send({ data: products });
    } catch (error) {
        console.error('Error fetching products:', error.message);
        res.status(500).send('Internal Server Error');
    }
};
const getProductWithImages =  async (req, res) => {
    try {
        const productId = req.params.productId;

        const productWithImages = await db.products.findOne({
            where: { id: productId },
            include: [
                {
                    model: db.ProductImage,
                    as: 'images',
                },
            ],
        });

        if (!productWithImages) {
            return res.status(404).json({ error: 'Product not found' });
        }

        return res.status(200).json(productWithImages);
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
};
// 8. Upload Image Controller

// //const storage = multer.diskStorage({
//     destination: (req, file, cb) => {
//         cb(null, 'Images')
//     },
//     filename: (req, file, cb) => {
//         cb(null, Date.now() + path.extname(file.originalname))
//     }
// //})

// //const upload = multer({
//     storage: storage,
//     limits: { fileSize: '1000000' },
//     fileFilter: (req, file, cb) => {
//         const fileTypes = /jpeg|jpg|png|gif/
//         const mimeType = fileTypes.test(file.mimetype)  
//         const extname = fileTypes.test(path.extname(file.originalname))

//         if(mimeType && extname) {
//             return cb(null, true)
//         }
//         cb('Give proper files formate to upload')
//     }
// //}).single('image')

module.exports = {
    addProduct,
    getAllProducts,
    getOneProduct,
    updateProduct,
    deleteProduct,
    getProductReviews,
    getProductWhere,
    getProductWithImages
}