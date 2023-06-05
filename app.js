const express = require('express');
const client = require('./routes/client');
const app = express();
app.use(express.static('public'));
app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(express.urlencoded({ extended: true }))
app.use(client)
const Instructor = require('./models/Instructor');

// console.log(Instructor.tableName);

app.listen(3033, () => {
    console.log('Example app listening on port 3033!');
});