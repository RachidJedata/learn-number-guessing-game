that is my database quieries or you can use .sql
CREATE TABLE users(
	user_id SERIAL PRIMARY KEY,
	name VARCHAR(22)
);
CREATE TABLE number_guesses(
	number_guess_id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	num_before_guess INT DEFAULT 0,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);