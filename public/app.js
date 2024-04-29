// Requirements 
require('dotenv').config();
const express = require("express");
const app = express();
const axios = require("axios");
const path = require("path");
const mysql = require('mysql2');

// New port to run
const PORT = process.env.PORT || 3000;
app.set('view engine', 'ejs');
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

// Database connection using .env
const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PW,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 10,
    port: process.env.DB_PORT,
    multipleStatements: true
});

connection.getConnection((err) => {
    if (err) return console.log(err.message);
    console.log("connected to local mysql db using .env properties");
});

// Rarity mapping to display on cards with meaningful data rather than raw numbers.
const rarityMap = {
    1: "Rare Holo",
    2: "Rare",
    3: "Common",
    4: "Uncommon"
};

// Expansions mapping 
const expansionsMap = {
    1: "Base Set",
    2: "Jungle",
    3: "Fossil",
    4: "Base Set 2"
};

// Render all card data
app.get('/', (req, res) => {
    let ep = `http://localhost:4000/cards`;

    axios.get(ep)
        .then((response) => {
            let cardData = response.data;
            res.render('card', { titletext: 'Our Cards', cardData: cardData.data, rarityMap: rarityMap });
        })
        .catch((error) => {
            console.error('Error fetching card data:', error);
            res.status(500).send('Error fetching card data');
        });
});

// Render all Card URLs
app.get('/cards/url', (req, res) => {
    let ep = `http://localhost:4000/cards/url`;

    axios.get(ep)
        .then((response) => {
            let urls = response.data.urls;
            res.render('card', { titletext: 'Our Cards', cardData: urls, rarityMap: rarityMap });
        })
        .catch((error) => {
            console.error('Error fetching URLs:', error);
            res.status(500).send('Error fetching URLs');
        });
});

// Start the server
const server = app.listen(PORT, () => {
    console.log(`Server is running on port ${server.address().port}`);
});
