const PG = require("pg")

module.exports = new PG.Pool({
    user: "postgres",
    password: "postgres",
    database: "UNI",
    host: "localhost",
    port: 5432,
})