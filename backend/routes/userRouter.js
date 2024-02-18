const userController = require('../controllers/UserController')


// router
const router = require('express').Router()

//--------------------------------------------------------------------------------//
//add user
router.post('/addUser', userController.addUser);
router.post('/loginUser', userController.logInUser);
//--------------------------------------------------------------------------------//
router.get('/getAllUsers', userController.getAllUsers);
module.exports = router