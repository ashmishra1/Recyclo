const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// create posts schema and model!
const PostsSchema = new Schema({
    caption: {
        type: String,
        required: true
    },
    tags: {
        type: String,
        required: true
    },
    procedure: {
        type: String,
        default: ""
    },
    price: {
        type: String,
        default: 0
    }
    ,
    photo: {
        type: String
    }
},
    {
        timestamps: true
    })

const Posts = mongoose.model('posts', PostsSchema);

module.exports = Posts;