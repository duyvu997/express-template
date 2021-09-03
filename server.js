const express = require('express')
const http = require('http')
const fs = require('fs')
const path = require('path')
const morgan = require('morgan')

const app = express()

const logStream = fs.createWriteStream(
    path.join(__dirname, 'app.log'),
    { flags: 'a' }
)

app.use(morgan('common', { stream: logStream }))

app.get('/', function (req, res, next) {
    res.status(200).json({ name: 'andy' })
})

http.createServer(app).listen(3000, function () {
    console.log('App started on port 3000')
})
