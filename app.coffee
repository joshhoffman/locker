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
beersRoute.get beerController.getBeers

beerRoute = router.route '/beers/:beer_id'

beerRoute.get beerController.getBeer
beerRoute.put beerController.putBeer
beerRoute.delete beerController.deleteBeer

app.use '/api', router

app.listen port
console.log 'listening'