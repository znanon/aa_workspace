PRAGMA foregin_keys = ON;

DROP table if exists users;

create table users (
  id integer primary key,
  fname text not null,
  lname text not null
);

DROP table if exists questions;

create table questions (
  id integer primary key,
  title text not null,
  body text not null,
  user_id integer not null,

  foreign key (user_id) references users (id)
);

DROP table if exists question_follows;

create table question_follows (
  id integer primary key,
  question_id integer not null,
  user_id integer not null,

  foreign key (user_id) references users (id),
  foreign key (question_id) references questions (id)
);

DROP table if exists replies;

create table replies (
  id integer primary key,
  question_id integer not null,
  user_id integer not null,
  reply_id integer,
  body text not null,

  foreign key (user_id) references users (id),
  foreign key (question_id) references questions (id),
  foreign key (reply_id) references replies (id)
);

DROP table if exists question_likes;

create table question_likes (
  id integer primary key,
  question_id integer not null,
  user_id integer not null,
  liked integer not null,

  foreign key (user_id) references users (id),
  foreign key (question_id) references questions (id)
);

INSERT INTO
 users (fname, lname)
VALUES 
 ('Jason', 'Bourne'),
 ('Linda', 'Liu'),
 ('Zeno', 'Nanon'),
 ('Nancy', 'Drew'),
 ('Jim', 'Carrey'),
 ('Marriah', 'Carrey'),
 ('Britney', 'Spears');

INSERT INTO
 questions (title, body, user_id)
VALUES 
  ('Ruby', 'What''s the time complexity of index?', (SELECT id FROM users WHERE fname = 'Jason' and lname = 'Bourne')),
  ('SQL', 'What''s in my database?', (SELECT id FROM users WHERE fname = 'Linda' and lname = 'Liu')),
  ('Ruby on Rails', 'How do I code?', (SELECT id FROM users WHERE fname = 'Zeno' and lname = 'Nanon')),
  ('Javascript', 'Why is my website blank?', (SELECT id FROM users WHERE fname = 'Nancy' and lname = 'Drew')),
  ('C++', 'How do I program my robot?', (SELECT id FROM users WHERE fname = 'Jim' and lname = 'Carrey')),
  ('C', 'How do I use threading to shorten the efficency of my sort method?', (SELECT id FROM users WHERE fname = 'Marriah' and lname = 'Carrey'));

INSERT INTO
 replies (question_id, user_id, reply_id, body)
VALUES 
  ((SELECT id FROM questions WHERE title = 'Ruby'), (SELECT id FROM users WHERE fname = 'Linda' and lname = 'Liu'), NULL, 'I don''t know Ruby'),
  ((SELECT id FROM questions WHERE title = 'SQL'), (SELECT id FROM users WHERE fname = 'Zeno' and lname = 'Nanon'), NULL, 'I don''t know SQL'),
  ((SELECT id FROM questions WHERE title = 'Ruby on Rails'), (SELECT id FROM users WHERE fname = 'Nancy' and lname = 'Drew'), NULL, 'I don''t know Ruby on Rails'),
  ((SELECT id FROM questions WHERE title = 'Javascript'), (SELECT id FROM users WHERE fname = 'Jim' and lname = 'Carrey'), NULL, 'I don''t know Javascript'),
  ((SELECT id FROM questions WHERE title = 'C++'), (SELECT id FROM users WHERE fname = 'Marriah' and lname = 'Carrey'), NULL, 'I don''t know C++'),
  ((SELECT id FROM questions WHERE title = 'C'), (SELECT id FROM users WHERE fname = 'Jason' and lname = 'Bourne'), NULL, 'I don''t know C');
  

INSERT INTO
 replies (question_id, user_id, reply_id, body)
VALUES 
  ((SELECT id FROM questions WHERE title = 'Ruby'), (SELECT id FROM users WHERE fname = 'Britney' and lname = 'Spears'), (SELECT id FROM replies WHERE body = 'I don''t know Ruby'), 'Wanna hear me sing?'),
  ((SELECT id FROM questions WHERE title = 'SQL'), (SELECT id FROM users WHERE fname = 'Britney' and lname = 'Spears'), (SELECT id FROM replies WHERE body = 'I don''t know SQL'), 'Wanna hear me sing?'),
  ((SELECT id FROM questions WHERE title = 'Ruby on Rails'), (SELECT id FROM users WHERE fname = 'Britney' and lname = 'Spears'), (SELECT id FROM replies WHERE body = 'I don''t know Ruby on Rails'), 'Wanna hear me sing?'),
  ((SELECT id FROM questions WHERE title = 'Javascript'), (SELECT id FROM users WHERE fname = 'Britney' and lname = 'Spears'), (SELECT id FROM replies WHERE body = 'I don''t know Javascript'), 'Wanna hear me sing?'),
  ((SELECT id FROM questions WHERE title = 'C++'), (SELECT id FROM users WHERE fname = 'Britney' and lname = 'Spears'), (SELECT id FROM replies WHERE body = 'I don''t know C++'), 'Wanna hear me sing?'),
  ((SELECT id FROM questions WHERE title = 'C'), (SELECT id FROM users WHERE fname = 'Britney' and lname = 'Spears'), (SELECT id FROM replies WHERE body = 'I don''t know C'), 'Wanna hear me sing?');
  
INSERT INTO
 question_likes (question_id, user_id, liked)
VALUES 
  ((SELECT id FROM questions WHERE title = 'Ruby'), (SELECT id FROM users WHERE fname = 'Zeno' and lname = 'Nanon'), 1),
  ((SELECT id FROM questions WHERE title = 'SQL'), (SELECT id FROM users WHERE fname = 'Nancy' and lname = 'Drew'), 1),
  ((SELECT id FROM questions WHERE title = 'Ruby on Rails'), (SELECT id FROM users WHERE fname = 'Jim' and lname = 'Carrey'), 1),
  ((SELECT id FROM questions WHERE title = 'Javascript'), (SELECT id FROM users WHERE fname = 'Marriah' and lname = 'Carrey'), 1),
  ((SELECT id FROM questions WHERE title = 'C++'), (SELECT id FROM users WHERE fname = 'Jason' and lname = 'Bourne'), 1),
  ((SELECT id FROM questions WHERE title = 'C'), (SELECT id FROM users WHERE fname = 'Linda' and lname = 'Liu'), 1);
