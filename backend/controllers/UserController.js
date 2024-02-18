const db = require('../models')

// image Upload
const path = require('path')

// create main Model
const User = db.users;
// main work
// 1. create product

const addUser = async (req, res) => {
    try {
        if (!req.body.firstName || !req.body.lastName || !req.body.email || !req.body.password) {
            return res.status(400).send('Missing required fields');
        }

        const user = await User.create({
            firstName: req.body.firstName,
            lastName: req.body.lastName,
            email: req.body.email,
            password: req.body.password,
        });

        res.status(200).send(user); // Send success response with created user
    } catch (error) {
        console.error(error);
        res.status(500).send('Error creating user'); // Handle errors gracefully
    }

}

// Log in user
const logInUser = async (req, res) => {
    try {
        let email = req.body.email
        let password = req.body.password
        console.log("----------------------------c" + email);
        //if (!isValidEmail(email)) {return res.status(400).send({ error: "Invalid email format" });}
        //if (!password) {return res.status(400).send({ error: "Invalid password format" });}
        let user = await User.findOne({ where: { email: email } })
        if (!user) {
            return res.status(401).send({ error: "Invalid email" });
        }
        if (password != user.password) {
            return res.status(401).send({ error: "Invalid password" });
        }

        return res.status(200).send(user); // Example: Send only the user ID
    } catch (error) {
        console.error(error);
        res.status(500).send({ error: "Internal server error" });
    }

}
// 2. get all products

const getAllUsers = async (req, res) => {

    let users = await User.findAll({})
    console.log(users)
    res.status(200).send(users)

}

// 3. get single product

const getOneUser = async (req, res) => {

    let id = req.params.id
    let user = await User.findOne({ where: { id: id } })
    res.status(200).send(user)

}


const updateUser = async (req, res) => {

    let id = req.params.id

    const user = await User.update(req.body, { where: { id: id } })

    res.status(200).send(user)


}

// 5. delete user by id

const deleteUser = async (req, res) => {

    let id = req.params.id

    await User.destroy({ where: { id: id } })

    res.status(200).send('User is deleted !')

}


module.exports = {
    addUser,
    logInUser,
    getAllUsers,
}