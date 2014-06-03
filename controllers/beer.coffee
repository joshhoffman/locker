Beer = require '../models/beer'

exports.postBeer = (req, res) ->
    beer = new Beer()

    beer.name = req.body.name
    beer.type = req.body.type
    beer.quantity = req.body.quantity

    beer.save (err) ->
        res.send err if err

        res.json { message: "Beer added to locker", data: beer }

exports.getBeer = (req, res) ->
    Beer.find (err, beers) ->
        res.send err if err

        res.json beers