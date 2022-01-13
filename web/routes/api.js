const express = require('express');
const router = express.Router();
const Posts = require('../models/posts');

router.get("/posts", (req, res) => {
    Posts.find({})
        .then((posts) => {
            res.json({
                status: true,
                response: 'All posts fetched!',
                listOfPosts: posts
            })
        })
        .catch(err => res.status(422).send({ error: err.message }));
})

router.post('/add-post', (req, res) => {
    const { caption,tags, procedure, price } = req.body;

    if (req.files) {
        var file = req.files.photo;
        var filename = file.name;

        file.mv('./uploads/' + filename, (err) => {
            if (err) {
                res.send({ error: err.message })
            } else {
                const post = new Posts({
                    caption,
                    tags,
                    procedure,
                    price,
                    photo: filename
                });

                post.save()
                    .then(() => {
                        res.json({
                            status: true,
                            response: 'Post added!',
                            details: post
                        })
                    })
                    .catch((err) => res.status(422).send({ error: err.message }));
            }
        })
    } else {
        const post = new Posts({
            caption,
            tags,
            procedure,
            price
        });
        post.save()
            .then(() => {
                res.json({
                    status: true,
                    response: 'Post added!',
                    details: post
                })
            })
            .catch((err) => res.status(422).send({ error: err.message }));
    }
})

router.put("/posts/:id", (req, res) => {
    Posts.findByIdAndUpdate({ _id: req.params.id }, req.body)
        .then(() => {
            Posts.findOne({ _id: req.params.id })
                .then((post) => {
                    res.json({
                        status: true,
                        response: 'Post details updated!',
                        details: post
                    })
                })
                .catch(err => res.status(422).send({ error: err.message }));
        })
        .catch(err => res.status(422).send({ error: err.message }));

})

router.delete("/posts/:id", (req, res) => {
    Posts.findByIdAndRemove({ _id: req.params.id })
        .then(() => {
            res.json({
                status: true,
                response: 'Post deleted!'
            })
        })
        .catch(err => res.status(422).send({ error: err.message }));
})

router.post("/search", async (req,res) => {
    const queryString = req.body.query;
    const queryStrings = queryString.split(",");
    allQueries =[]
    queryStrings.forEach(element => {
        allQueries.push({tags : {$regex : String(element)}});
    });
    const allPosts = await Posts.find({$and : allQueries});

    if(!allPosts || allPosts.length === 0) res.status(400).send({error : "No post was found"})
    res.status(200).send(allPosts)
})



module.exports = router;