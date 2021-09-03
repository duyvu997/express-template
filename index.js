const express = require('express')
const http = require("http")
const app = express()

app.get('/', function (req, res, next) {
    res.status(200).json({ name: 'andy' })
})

http.createServer(app).listen(3000, function () {
    console.log('App started on port 3000')
})
