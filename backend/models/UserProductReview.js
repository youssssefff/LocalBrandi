module.exports = (sequelize, DataTypes) => {
    const UserProductReview = sequelize.define("UserProductReview", {
        // Add any additional columns for review details here (e.g., rating, review text)
    }, {
        timestamps: false, // Remove timestamps if not needed
    })
    return UserProductReview;
}