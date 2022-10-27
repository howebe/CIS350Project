const mongoose = require('mongoose');

const textbookSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    condition: {
        required: true,
        type: String,
        trim: true,
    },
    class: {
        required: true,
        type: String,
        trim: true,
    },
    university:{
        required: true,
        type: String,
        trim: true,
    },
    description: {
        required: false,
        type: String,
        trim: true,
    }
});

const Textbook = mongoose.model('Textbook', textbookSchema);

module.exports = Textbook;