const express = require('express')
const cors = require('cors')
const DBPool = require('./DBPool.js')

const PORT = 8000

const app = express()

app.use(express.json())
app.use(cors())

app.get('/', (req, res) => {
    res.send("awesome")
})

app.post('/add', async (req, res) => {
    const {name} = req.body

    const result = await DBPool.query("insert into Roles(role_name) values ($1)", [name])

    res.send(result)
})

app.get('/test2', async (req, res) => {
    res.send("workin22mg")
})

app.get('/test', async (req, res) => {
    //await DBPool.query("insert into Roles(role_name) values ($1)", [req.body])
    const result = await DBPool.query("select * from Roles")

    res.send(JSON.stringify(result.rows))
})

app.listen(PORT, () => {
    console.log(`on http://localhost:${PORT}/`)
})