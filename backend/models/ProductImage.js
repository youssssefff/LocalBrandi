module.exports = (sequelize, DataTypes) => {
    const ProductImage = sequelize.define("productImage", {
        url: {
            type: DataTypes.STRING,
            validate: {
                isUrl: {
                    msg: 'Image must be a valid URL'
                }
            }
        },
        // Add any other fields if necessary
    });


    return ProductImage;
};
