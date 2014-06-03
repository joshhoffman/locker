Beer = require '../models/beer'

exports.postBeer = (req, res) ->
    beer = new Beer()

    beer.name = req.body.name
    beer.type = req.body.type
    beer.quantity = req.body.quantity

    beer.save (err) ->
        res.send err if err

        res.json { message: "Beer added to locker", data: beer }

exports.getBeers = (req, res) ->
    Beer.find (err, beers) ->
        res.send err if err

        res.json beers

exports.getBeer = (req, res) ->
    Beer.findById req.params.beer_id, (err, beer) ->
        res.send err if err

        res.json beer

exports.putBeer = (req, res) ->
    Beer.findById req.params.beer_id, (err, beer) ->
        res.send err if err

        beer.quantity = req.body.quantity

        beer.save (err) ->
            res.send err if err

            res.json beer

exports.deleteBeer = (req, res) ->
    Beer.findByIdAndRemove req.params.beer_id, (err) ->
        res.send err if err

        res.json { message: 'Removed from locker' }