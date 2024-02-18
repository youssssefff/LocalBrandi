'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.addColumn('products', 'category', {
      type: Sequelize.ENUM('shoes', 'clothing', 'accessories'),
      allowNull: false,
    });
    await queryInterface.addColumn('products', 'subCategory', {
      type: Sequelize.ENUM('sweetshirt', 'hoodie', 't-shirt', 'jacket', 'pant', 'short-pant', 'socks'),
      allowNull: false,
    });
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeColumn('products', 'category');
    await queryInterface.removeColumn('products', 'subCategory');
  },
};
