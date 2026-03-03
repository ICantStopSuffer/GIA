const express = require('express')
const DBPool = require('./DBPool.js')
const PORT = 8000

const app = express()

app.use(express.json())

app.get('/', (req, res) => {
    res.send("awesome")
})

app.post('/add', async (req, res) => {
    const {name} = req.body

    const result = await DBPool.query("insert into Roles(role_name) values ($1)", [name])

    res.send(result)
})

app.get('/test', async (req, res) => {
    //await DBPool.query("insert into Roles(role_name) values ($1)", [req.body])
    const result = await DBPool.query("select * from Roles")

    res.send(result.rows.join(' '))
})

app.listen(PORT, () => {
    console.log(`on http://localhost:${PORT}/`)
})