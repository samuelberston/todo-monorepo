CREATE EXTENSION pgcrypto;

--DROP DATABASE IF EXISTS todo;
DROP SCHEMA IF EXISTS todo CASCADE;

--CREATE DATABASE todo;
CREATE SCHEMA todo;

DROP TABLE IF EXISTS todo.lists CASCADE;

CREATE TABLE todo.lists (
  list_key SERIAL NOT NULL,
  list_uuid UUID PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

INSERT INTO todo.lists (list_key, list_uuid, name) VALUES (1, gen_random_uuid(), 'default');

DROP TABLE IF EXISTS todo.todos CASCADE;

CREATE TABLE todo.todos (
  todo_id SERIAL NOT NULL PRIMARY KEY,
  task VARCHAR(50) NOT NULL,
  description VARCHAR(1000),
  date_created VARCHAR(24) NOT NULL,
  date_due VARCHAR(24) NOT NULL,
  priority VARCHAR(2),
  user_uuid VARCHAR(60) NOT NULL
);

INSERT INTO todo.todos (task, description, date_created, date_due, priority, user_uuid) VALUES ('Create a todo list app with Node.js', 'implement core functionality and style', '2022-11-13T00:46:19.750Z', '2022-12-25T21:15:34.283Z', 'p2', 'c75321b1-084a-4a1f-9f7e-7e72bbd2ef13');
INSERT INTO todo.todos (task, description, date_created, date_due, priority, user_uuid) VALUES ('Publish the app on GitHub', 'GitHub is a great sourcecode repository', '2022-11-13T00:48:59.204Z', '2022-11-13T00:48:59.204Z', 'p1', 'c75321b1-084a-4a1f-9f7e-7e72bbd2ef13');
INSERT INTO todo.todos (task, description, date_created, date_due, priority, user_uuid) VALUES ('Deploy the app on aws', 'We love AWS', '2022-11-13T00:55:15.320Z', '2022-11-13T00:55:15.320Z', 'p3', 'c75321b1-084a-4a1f-9f7e-7e72bbd2ef13');
INSERT INTO todo.todos (task, description, date_created, date_due, priority, user_uuid) VALUES ('Containerize the app with Docker', 'Eventually split up into containerized microservices', '2022-11-13T00:55:15.320Z', '2022-11-13T00:55:15.320Z', 'p4', 'c75321b1-084a-4a1f-9f7e-7e72bbd2ef13');

DROP TABLE IF EXISTS TODO.users CASCADE;

CREATE TABLE todo.users (
  user_key SERIAL NOT NULL,
  user_uuid UUID PRIMARY KEY,
  user_id VARCHAR(69) UNIQUE NOT NULL,
  user_email VARCHAR(69) UNIQUE NOT NULL
);

INSERT INTO todo.users (user_uuid, user_id, user_email) VALUES ('c75321b1-084a-4a1f-9f7e-7e72bbd2ef13', 'google-oauth2|113421175681730408776', 'samuelberston@gmail.com');

DROP TABLE IF EXISTS TODO.tags CASCADE;

CREATE TABLE todo.tags (
  tag_id SERIAL NOT NULL PRIMARY KEY,
  tag VARCHAR(25) NOT NULL
);

INSERT INTO todo.tags (tag) VALUES ('Work');
INSERT INTO todo.tags (tag) VALUES ('Personal');
INSERT INTO todo.tags (tag) VALUES ('Social');
INSERT INTO todo.tags (tag) VALUES ('Backlog');

DROP TABLE IF EXISTS todo.todos_tags CASCADE;

CREATE TABLE todo.todos_tags (
  todo_id INT NOT NULL,
  tag_id INT NOT NULL,
  FOREIGN KEY (todo_id) REFERENCES todo.todos(todo_id),
  FOREIGN KEY (tag_id) REFERENCES todo.tags(tag_id)
);

INSERT INTO todo.todos_tags (todo_id, tag_id) VALUES (1, 1);
INSERT INTO todo.todos_tags (todo_id, tag_id) VALUES (2, 1);
INSERT INTO todo.todos_tags (todo_id, tag_id) VALUES (3, 1);
INSERT INTO todo.todos_tags (todo_id, tag_id) VALUES (3, 2);
INSERT INTO todo.todos_tags (todo_id, tag_id) VALUES (3, 3);
INSERT INTO todo.todos_tags (todo_id, tag_id) VALUES (3, 4);
