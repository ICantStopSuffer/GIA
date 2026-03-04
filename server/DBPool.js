const PG = require("pg")

module.exports = new PG.Pool({
    user: "postgres",
    password: "admin",
    database: "UNI",
    host: "localhost",
    port: 5432,
})