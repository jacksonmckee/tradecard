const express = require("express");
const mysql = require("mysql");
const app = express();

const port = process.env.PORT || 3000; 

const pool = mysql.createPool({
  host: 'localhost',
  user: 'jmckee50',
  password: 'eZo0abUAEQY8YHlk',
  database: '40289157'
});

app.listen(port, (err) => {
    if (err) throw err;
    console.log(`Server is listening on //localhost:${port}`);
});
