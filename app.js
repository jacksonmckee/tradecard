// Requirements 
require('dotenv').config();
const express = require("express");
const app = express();
const axios = require("axios");
const path = require("path");
const mysql = require('mysql2');

app.use(express.urlencoded({ extended: true }));
app.set("view engine", "ejs");

// New port to run
const PORT = process.env.PORT || 3000;

app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

// Database connection using .env
const connection = mysql.createPool({
    host: 'localhost',
    user: 'root', 
    password: '', 
    database: '40289157',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 10,
    port: process.env.DB_PORT,
    multipleStatements: true
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

// Index page route
app.get("/", (req, res) => {
    res.render("index")
  });

  // Sign in route
app.get('/sign', (req, res) => {
    res.render("sign")
});

 // Discussion route
 app.get('/discussion', (req, res) => {
    res.render("discussion")
});

 // How to play route
 app.get('/howtoplay', (req, res) => {
    res.render("howtoplay")
});

 // Cards page route
app.get('/card', (req, res) => {
    let ep = 'http://localhost:4000/carddata';
    
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

  app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});