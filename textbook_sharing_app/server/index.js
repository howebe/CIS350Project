console.log("Hello, World");

const express = require('express');
const textRouter = require("./textRoute");
const mongoose = require('mongoose');

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://GeneralUser:GeneralPassword@cluster0.q3ooyqe.mongodb.net/?retryWrites=true&w=majority"

// Middleware
app.use(express.json());
app.use(textRouter);

mongoose.connect(DB).then(() => {
    console.log("Connection Successful");
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT} hello`);
});