mongoose = require 'mongoose'

BeerSchema = new mongoose.Schema {
    name: string,
    type: string,
    quantity: number
}

module.exports = mongoose.model 'Beer', BeerSchema