express = require 'express'
mongoose = require 'mongoose'
bodyparser = require 'body-parser'
Beer = require './models/beer'

mongoose.connect 'mongodb://localhost:27017/beerlocker'

app = express()

app.use bodyparser()

port = process.env.PORT || 3000

router = express.Router()

router.get '/', (req, res) ->
    res.json {message: 'low on stuff'}

beersRoute = router.route '/beers'

beersRoute.post (req, res) ->
    beer = new Beer()

    beer.name = req.body.name
    beer.type = req.body.type
    beer.quantity = req.body.quantity

    beer.save (err) ->
        res.send err if err

        res.json { message: "Beer added to locker", data: beer }

app.use '/api', router

app.listen port
console.log 'listening'