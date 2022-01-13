const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const upload = require('express-fileupload');
const routes = require('./routes/api');

// get the uri for db connection!
const uri = process.env.uri || require('./config');

// set up the express app!
const app = express();

let port = process.env.PORT || 4000;

// upload!
app.use(upload());

// connect to mongodb!
mongoose.connect(uri, () => {
    console.log('Connected to mongo db!');
})

// middleware!
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));


// routes!
app.use('/api',routes);
app.use('/uploads', express.static(process.cwd() + '/uploads'))

app.get("/", (req, res) => {
    res.send('hello world this is the base url. Go to /api to access the apis');
})

app.listen(port, () => {
    console.log(`Example app is listening in port ${port}`);
})