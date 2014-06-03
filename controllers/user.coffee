mongoose = require 'mongoose'
bcrypt = require 'bcrypt-nodejs'


UserSchema = new mongoose.Schema {
    username: {
        type: String,
        unique: true,
        required: true
    },
    password: {
        type: string,
        require: true
    }
}

UserSchema.pre 'save', (callback) ->
    user = this

    return callback() if not user.isModified 'password'

    bcrypt.genSalt 5, (err, salt) ->
        return callback err if err

        bcrypt.hash user.password, salt, null, (err, hash) ->
            return callback err if err

            user.password = hash
            callback()

module.exports = mongoose.model 'User', UserSchema