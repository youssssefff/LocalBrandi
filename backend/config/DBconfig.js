module.exports = {
    HOST: 'localhost',
    USER: 'root',
    PASSWORD: 'eracorenet',
    DB: 'local_brand',
    dialect: 'mysql',

    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
}