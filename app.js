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

// Cards Array

const cards = [
    { name: "Blastoise", rarity: "Rare", likes: 31 },
    { name: "Charizard", rarity: "Rare Holo", likes: 29 },
    { name: "Gyarados", rarity: "Rare Holo", likes: 8 },
    { name: "Magneton", rarity: "Rare Holo", likes: 13 },
    { name: "Ninetales", rarity: "Rare Holo", likes: 15 },
    { name: "Venasaur", rarity: "Rare Holo", likes: 2 },
    { name: "Dragonair", rarity: "Rare", likes: 12 },
    { name: "Electabuzz", rarity: "Rare", likes: 16 },
    { name: "Arcanine", rarity: "Uncommon", likes: 19 },
    { name: "Dewgong", rarity: "Uncommon", likes: 0 },
    { name: "Growlithe", rarity: "Uncommon", likes: 17 },
    { name: "Pikachu", rarity: "Common", likes: 47 },
    { name: "Lapras", rarity: "Rare Holo", likes: 3 },
    { name: "Moltres", rarity: "Rare Holo", likes: 5 },
    { name: "Zapdos", rarity: "Rare Holo", likes: 17},
    { name: "Gengar", rarity: "Rare", likes: 18 },
    { name: "Hypno", rarity: "Rare", likes: 21 },
    { name: "Raichu", rarity: "Rare Holo", likes: 11 },
    { name: "Arbok", rarity: "Uncommon", likes: 7 },
    { name: "Omanyte", rarity: "Common", likes: 21 },
    { name: "Flareon", rarity: "Rare Holo", likes: 12 },
    { name: "Mr. Mime", rarity: "Rare Holo", likes: 2 },
    { name: "Pinsir", rarity: "Rare Holo", likes: 20 },
    { name: "Wigglytuff", rarity: "Rare Holo", likes: 16 },
    { name: "Jolteon", rarity: "Rare", likes: 4 },
    { name: "Pidgeot", rarity: "Rare Holo", likes: 1 },
    { name: "Venomoth", rarity: "Rare Holo", likes: 2 },
    { name: "Victrabeel", rarity: "Rare Holo", likes: 14 },
    { name: "Primeape", rarity: "Uncommon", likes: 20 },
    { name: "Rhyhorn", rarity: "Common", likes: 15 },
    { name: "Chansey", rarity: "Rare Holo", likes: 1 },
    { name: "Hitmonchan", rarity: "Rare Holo", likes: 17 },
    { name: "Nidoking", rarity: "Rare Holo", likes: 10 },
    { name: "Poliwrath", rarity: "Rare Holo", likes: 13 },
    { name: "Beedrill", rarity: "Rare", likes: 12 },
    { name: "Dugtrio", rarity: "Rare", likes: 0 },
    { name: "Kangaskhan", rarity: "Rare", likes: 5 },
    { name: "Seaking", rarity: "Uncommon", likes: 9 },
    { name: "Caterpie", rarity: "Common", likes: 4 },
    { name: "Rattata", rarity: "Common", likes: 7 },

];

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

// Create account route
app.post('/create', (req, res) => {
    const { user_name, email, password } = req.body;

    // Add new account into user table
    connection.query(
        'INSERT INTO user (user_name, email, password) VALUES (?, ?, ?)',
        [user_name, email, password],
        (error, results) => {
            if (error) {
                console.error('Error creating your account:', error);
                return res.status(500).send('Error creating your account, try again.');
            }

            // Account created
            console.log('Sign up complete', results);

            // Create a user collection in table, no name for collection though.
            const userId = results.insertId;
            connection.query(
                'INSERT INTO user_collection (user_id) VALUES (?)',
                [userId],
                (error, results) => {
                    if (error) {
                        console.error('Error adding user to collection:', error);
                    } else {
                        console.log('User added to collection:', results);
                    }
                }
            );
            // Once logged in, directed to index page
            res.redirect('/');
        }
    );
});
// Route to handle requests to the login page
app.get('/signin', (req, res) => {
    // Directed to index
    res.send('/');
});

// Sign in route
app.post('/signin', (req, res) => {
    const { email, password } = req.body;

    // This will check if the for is filled in
    if (!email || !password) {
        return res.status(400).send('Email and password are required');
    }

    // This checks if the the email is in the database
    connection.query(
        'SELECT * FROM user WHERE email = ?',
        [email],
        (error, results) => {
            if (error) {
                console.error('Error retrieving user:', error);
                return res.status(500).send('Internal Server Error');
            }
            // Check if a user with the provided email exists
            if (results.length === 0) {
                return res.status(401).send('Invalid login details');
            }
            // Checks the password provided
            const user = results[0];
            if (user.password !== password) {
                return res.status(401).send('Invalid login details');
            }

            // Once successfully logged, directed to index
            res.redirect('/');
        }
    );
});

// Discussion route
app.get('/discussion', (req, res) => {
    res.render("discussion")
});

// How to play route
app.get('/howtoplay', (req, res) => {
    res.render("howtoplay")
});

// User collection route
app.get('/usercollection', (req, res) => {
    res.render("usercollection")
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