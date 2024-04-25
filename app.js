const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;
const axios = require("axios");
const path = require("path"); 

app.set('view engine', 'ejs');
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

// All card data

app.get('/', (req, res) => {
    let ep = `http://localhost:4000/cards`;

    axios.get(ep)
        .then((response) => {
            let cardData = response.data; 
            res.render('card', { titletext: 'Our Cards', cardData: cardData.data });  
        })
        .catch((error) => {
            console.error('Error fetching card data:', error);
            res.status(500).send('Error fetching card data');
        });
});

// URLs
app.get('/cards/url', (req, res)=> { 
    let ep = `http://localhost:4000/cards/url`;

    axios.get(ep)
        .then((response) => {
            let urls = response.data.urls; 
            res.render('card', { titletext: 'Our Cards', cardData: urls });
        })
        .catch((error) => {
            console.error('Error fetching URLs:', error);
            res.status(500).send('Error fetching URLs');
        });
});


const server = app.listen(PORT, () => {
    console.log(`API started on port ${server.address().port}`);
});


