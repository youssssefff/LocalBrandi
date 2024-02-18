module.exports = (sequelize, DataTypes) => {

    const Product = sequelize.define("product", {
        mainImage: {
            type: DataTypes.STRING,
            validate: {
                isUrl: {
                    msg: 'Image must be a valid URL'
                }
            }
        },
        color: {
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Color cannot be null'
                },
                notEmpty: {
                    msg: 'Color cannot be empty'
                },
                len: {
                    args: [3, 255],
                    msg: 'Color must be between 3 and 255 characters'
                }
            }
        },
        
        title: {
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Title cannot be null'
                },
                notEmpty: {
                    msg: 'Title cannot be empty'
                },
                len: {
                    args: [3, 255],
                    msg: 'Title must be between 3 and 255 characters'
                }
            }
        },
        price: {
            type: DataTypes.INTEGER,
            validate: {
                isInt: {
                    msg: 'Price must be an integer'
                },
                min: {
                    args: [0],
                    msg: 'Price must be a non-negative integer'
                }
            }
        },
        description: {
            type: DataTypes.TEXT,
            validate: {
                len: {
                    args: [0, 1000], // Adjust the maximum length as needed
                    msg: 'Description must be at most 1000 characters'
                }
            }
        },
        published: {
            type: DataTypes.BOOLEAN
        },
        gender: {
            type: DataTypes.ENUM('men', 'women', 'unisex', 'kids'),
            allowNull: false,
        },
        newArrival: {
            type: DataTypes.BOOLEAN,
            defaultValue: true,
        }, 
        bestSeller: {
            type: DataTypes.BOOLEAN,
            defaultValue: false,
        },
        category: {
            type: DataTypes.ENUM('shoes','clothing','accessories'),
            allowNull: false,
        },
        subCategory:{
            type: DataTypes.ENUM('sweetshirt','hoodie','t-shirt','jacket','pant','short-pant','socks'),
            allowNull: false,
        },
        style:{
            type: DataTypes.ENUM('oversized','regular','fit'),
            allowNull: false,
        },
        size: {
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Size cannot be null'
                },
                notEmpty: {
                    msg: 'Size cannot be empty'
                },
                len: {
                    args: [3, 255],
                    msg: 'Size must be between 3 and 255 characters'
                }
            }
        },
    })
    return Product

}