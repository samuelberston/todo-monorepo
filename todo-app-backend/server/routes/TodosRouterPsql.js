const express = require('express');
const postgres = require('../psql.js');
const { body, validationResult } = require('express-validator');

const { getTodos, getUserTodos, postTodo, putTodo, deleteTodo } = require('../queries/todosQueries.js');

const TodosRouterPsql = express.Router();

// receive all todos from the db
TodosRouterPsql.get('/todos', (req, res) => {
  console.log('req params: ', req.query.user_uuid);
  console.log('user_id', req.auth.payload.sub);
  if (req.auth.payload.sub !== undefined) {
    console.log('todo query: ', `SELECT * FROM todo.todos WHERE user_uuid = ${req.query.user_uuid} ORDER BY todo_id;`)
    postgres.query(getUserTodos, [req.query.user_uuid], (err, data) => {
        if (err) { throw err; }
        res.status(200).send(data.rows);
    });
  } else {
    postgres.query(getTodos, (err, data) => {
      if (err) { throw err; }
      res.status(200).send(data.rows);
    });
  }
});

// create a new todo item
TodosRouterPsql.post('/todos', (req, res) => {
  console.log('post todo');
  // insert new todo into db
  let { taskName, description, date_created, due, priority, user_uuid } = req.body;

  console.log("todo data: ", req.body);

  // update the validation section to run synchronously -- create another validation function
  if (description == undefined) { description = "" }
  if (date_created == undefined) { date_created = "" }
  if (due == undefined) {
    date_due = ""
  } else {
    console.log('validating due date');
    body(due).isDate()
  }
  if (priority == undefined) { priority = "" }

  console.log("todo query: ", `INSERT INTO todo.todos (task, description, date_created, date_due, priority, user_uuid)
  VALUES ('${taskName}', "${description}", "${date_created}", "${due}", "${priority}", "${user_uuid}") RETURNING todo_id`)

  // use the express validator
  postgres.query(postTodo, [taskName, description, date_created, due, priority, user_uuid],
    (err, data) => {
      if (err) { throw err; }
      const todoId = data.rows[0].todo_id;
      console.log('created new todo with id: ', todoId);
      res.status(201).send([todoId]);
    });
});

// update a todo item
TodosRouterPsql.put('/todos', (req, res) => {
  console.log('put todo');
  console.log("req.body: ", req.body);
  let { todo_id, taskName, description, date_created, due, priority, user_uuid } = req.body;

  if (description == undefined) { description = ""}
  if (date_created == undefined) { date_created = ""}
  if (due == undefined) { due = ""}
  if (priority == undefined) { priority = ""}
  
  console.log('update todo query: ', `UPDATE todo.todos
  SET task = '${taskName}', description = '${description}', date_created = '${date_created}', date_due= '${due}', priority = '${priority}'
  WHERE todo_id = ${todo_id} AND user_id = ${user_uuid}`);

  postgres.query(putTodo, [taskName, description, date_created, due, priority, todo_id, user_uuid],
    (err, data) => {
      if (err) { throw err; }
      res.status(204).json({todo_id, user_id});
    });
});

// delete a todo item
TodosRouterPsql.delete('/todos', (req, res) => {
  const { todoId, user_uuid } = req.query;
  // remove from db
  postgres.query(deleteTodo, [todoId, user_uuid], (err, data) => {
    if (err) { throw err; }
    res.status(200).send(data);
  });
});

module.exports = TodosRouterPsql;