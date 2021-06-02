const pg = require('pg');

const database = {
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD
}

pg.types.setTypeParser(1114, str => str);

const pool = new pg.Pool(database);

module.exports = pool;