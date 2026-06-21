const express = require("express");
const axios = require("axios");

const app = express();

app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: true }));

const BACKEND_URL =
    process.env.BACKEND_URL ||
    "http://backend-service:5000";

app.get("/", (req, res) => {
    res.render("index");
});

app.post("/submit", async (req, res) => {
    try {
        const response = await axios.post(
            `${BACKEND_URL}/process`,
            req.body
        );

        res.send(response.data);

    } catch (error) {
        console.error(error.message);
        res.send("Error connecting backend");
    }
});

app.listen(3000, "0.0.0.0", () => {
    console.log("Frontend running on port 3000");
});