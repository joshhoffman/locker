express = require 'express'
mongoose = require 'mongoose'
bodyparser = require 'body-parser'
Beer = require './models/beer'
beerController = require './controllers/beer'

mongoose.connect 'mongodb://localhost:27017/beerlocker'

app = express()

app.use bodyparser()

port = process.env.PORT || 3000

router = express.Router()

router.get '/', (req, res) ->
    res.json {message: 'low on stuff'}

beersRoute = router.route '/beers'

beersRoute.post beerController.postBeers

beersRoute.get beerController.getBeer

beerRoute = router.route '/beers/:beer_id'

beerRoute.get (req, res) ->
    Beer.findById req.params.beer_id, (err, beer) ->
        res.send err if err

        res.json beer

beerRoute.put (req, res) ->
    Beer.findById req.params.beer_id, (err, beer) ->
        res.send err if err

        beer.quantity = req.body.quantity

        beer.save (err) ->
            res.send err if err

            res.json beer

beerRoute.delete (req, res) ->
    Beer.findByIdAndRemove req.params.beer_id, (err) ->
        res.send err if err

        res.json { message: 'Removed from locker' }

app.use '/api', router

app.listen port
console.log 'listening'