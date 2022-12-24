DROP DATABASE IF EXISTS TODO;
DROP SCHEMA IF EXISTS TODO CASCADE;

CREATE DATABASE TODO;
CREATE SCHEMA todo;

DROP TABLE IF EXISTS TODO.todos CASCADE;

CREATE TABLE todo.todos (
  todo_id INT NOT NULL PRIMARY KEY,
  task VARCHAR(50) NOT NULL,
  description VARCHAR(1000),
  date_created VARCHAR(24) NOT NULL,
  date_due VARCHAR(24) NOT NULL,
  priority VARCHAR(2)
);

INSERT INTO todo.todos (todo_id, task, description, date_created, date_due, priority) VALUES (1, 'Create a todo list app with Node.js', 'implement core functionality and style', '2022-11-13T00:46:19.750Z', '', 'p2');
INSERT INTO todo.todos (todo_id, task, description, date_created, date_due, priority) VALUES (2, 'Publish the app on GitHub', 'GitHub is a great sourcecode repository', '2022-11-13T00:48:59.204Z', '', 'p1');
INSERT INTO todo.todos (todo_id, task, description, date_created, date_due, priority) VALUES (3, 'Deploy the app on aws', 'We love AWS', '2022-11-13T00:55:15.320Z', '', 'p3');
INSERT INTO todo.todos (todo_id, task, description, date_created, date_due, priority) VALUES (4, 'Containerize the app with Docker', 'Eventually split up into containerized microservices', '2022-11-13T00:55:15.320Z', '', 'p4');

DROP TABLE IF EXISTS TODO.tags CASCADE;

CREATE TABLE todo.tags (
  tag_id INT NOT NULL PRIMARY KEY,
  tag VARCHAR(25) NOT NULL
);

INSERT INTO todo.tags (tag_id, tag) VALUES (1, 'Work');
INSERT INTO todo.tags (tag_id, tag) VALUES (2, 'Personal');
INSERT INTO todo.tags (tag_id, tag) VALUES (3, 'Social');
INSERT INTO todo.tags (tag_id, tag) VALUES (4, 'Backlog');

DROP TABLE IF EXISTS todo.todos_tags CASCADE;

CREATE TABLE todo.todos_tags (
  todo_id INT NOT NULL,
  tag_id INT NOT NULL,
  FOREIGN KEY (todo_id) REFERENCES todo.todos(todo_id),
  FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);

INSERT INTO todo.todos_tags (todo_id, tag_id) VALUES (1, 1);
INSERT INTO todo.todos_tags (todo_id, tag_id) VALUES (2, 1);
INSERT INTO todo.todos_tags (todo_id, tag_id) VALUES (3, 1);
INSERT INTO todo.todos_tags (todo_id, tag_id) VALUES (3, 2);
INSERT INTO todo.todos_tags (todo_id, tag_id) VALUES (3, 3);
INSERT INTO todo.todos_tags (todo_id, tag_id) VALUES (4, 4);
