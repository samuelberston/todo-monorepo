const { Client } = require('pg')


const port = 5432;

// for local postgresql connection
//const user = 'sberston';
//const host = 'localhost';
//const password = '';
//const database = '';

// for connection to docker postgresql (todo-db)
const user = 'postgres';
const password = 'docker';
const host = 'host.docker.internal';
const database = 'todo';

const postgres = new Client({
    host,
    port,
    password,
    user,
    database
});

postgres.connect((err) => {
    if (err) { throw err; }
    console.log(`database connected at ${port}`);
});

module.exports = postgres;
