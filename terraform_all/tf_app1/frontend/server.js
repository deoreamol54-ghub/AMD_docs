const express = require("express");
const axios = require("axios");

const app = express();

app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => {
    res.render("index");
});

app.post("/submit", async (req, res) => {
    try {
        const response = await axios.post(
            "http://backend:5000/process",
            req.body
        );

        res.send(response.data);
    } catch (error) {
        res.send("Error connecting backend");
    }
});

app.listen(3000, () => {
    console.log("Frontend running on port 3000");
});
