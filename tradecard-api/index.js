// Requirements 

require('dotenv').config();
const express = require("express");
const app = express();
const mysql = require('mysql2');

// New port to run API

const PORT = process.env.PORT || 4000;
app.set('view engine', 'ejs');

const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PW,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit:10,
    port: process.env.DB_PORT,
    multipleStatements: true
});

connection.getConnection((err)=>{
    if(err) return console.log(err.message);
    console.log("connected to local mysql db using .env properties");
});

const server = app.listen(PORT, () => {
    console.log(`API started on port ${server.address().port}`);
});

// Database connection

let db = mysql.createConnection({
    host: "localhost",
    user: "jmckee50",
    password: "eZo0abUAEQY8YHlk",
    database: "40289157",
    port: "3306",
  });
  
  db.connect((err) => {
    if (err) throw err;
  });
  


// All card data //

app.get('/cards', (req, res)=> { 

    let allcards = `SELECT *
                       FROM card`;
    connection.query(allcards, (err, data) => {  
        if(err) throw err;
        res.json({data});
    });

});

// Individual

app.get('/views/carddetails/:rowid', (req, res) => { 
    let r_id = req.params.rowid;
    let getcard = `SELECT *
                       FROM card WHERE card_id=?`;
    connection.query(getcard, [r_id], (err, data) => {  
        if(err) throw err;
        res.json({data});
    });
});


// Card URLs //

app.get('/cards/url', (req, res)=> { 
    let cardsurl = `SELECT url_img
                     FROM card`;
    connection.query(cardsurl, (err, data) => {  
        if(err) throw err;

        const urls = data.map(card => card.url_img);
        res.json({urls});
    });
});

// Expansions //

app.get('/cards/expansion/:expansionId', (req, res)=> { 
    let expansionId = req.params.expansionId;
    let cardsExpansions = `SELECT *
                      FROM card
                      WHERE expansion_id = ?`;
    connection.query(cardsExpansions, [expansionId], (err, data) => {  
        if(err) throw err;
        res.json({data});
    });
});

// User collections //

app.get('/cards/userCollection/:userCollectionId', (req, res)=> { 
    const userCollectionId = req.params.userCollectionId;
    let cardsQuery = `SELECT *
                      FROM card
                      WHERE user_collection_id = ?`;
    connection.query(cardsQuery, [userCollectionId], (err, data) => {  
        if(err) throw err;
        res.json({data});
    });
});
