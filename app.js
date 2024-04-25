const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;
const axios = require("axios");
app.set('view engine', 'ejs');
app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
    let ep = `http://localhost:4000/cards`;

    axios.get(ep)
        .then((response) => {
            let cardData = response.data; 
            res.render('card', { titletext: 'cards', cardData: cardData.data });  
        })
        .catch((error) => {
            console.error('Error fetching card data:', error);
            res.status(500).send('Error fetching card data');
        });
});

const server = app.listen(PORT, () => {
    console.log(`API started on port ${server.address().port}`);
});
