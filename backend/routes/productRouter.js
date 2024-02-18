// import controllers review, products
const productController = require('../controllers/productController')


// router
const router = require('express').Router()

// Products router
router.get('/getAllProducts', productController.getAllProducts);
router.get('/getProductWhere', productController.getProductWhere);
router.get('/getProductWithImages', productController.getProductWithImages);
module.exports = router