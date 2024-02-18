module.exports = (sequelize, DataTypes) => {

    const User = sequelize.define("user", {
        image: {
            type: DataTypes.STRING,
            validate: {
                isUrl: {
                    msg: 'Image must be a valid URL'
                }
            }
        },
        firstName: {
            type: DataTypes.STRING,
            allowNull: false
        },
        lastName: {
            type: DataTypes.STRING,
            allowNull: false
        },
        email: {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true, // Enforce unique emails
            validate: {
                isEmail: true, // Validate email format
            },
        },
        password: {
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                len: [6, 30], // Enforce password length
            },
        },
        address:{
            type: DataTypes.STRING,
        }

    })
    // User.beforeCreate((user) => {
    //     user.password = bcrypt.hashSync(user.password, 8); // Adjust salt rounds as needed
    // });

    return User;

}