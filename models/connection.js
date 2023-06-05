const mysql = require('mysql');
const util = require('util');
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'alusoft_training_portal'
})
connection.connect(err => console.log(err || 'Connected to the database'));
let query = util.promisify(connection.query.bind(connection))
module.exports = {connection, query}