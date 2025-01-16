#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USER_NAME

# Check if the user exists in the database
CLIENT=$($PSQL "SELECT user_id FROM users WHERE name='$USER_NAME'")

if [[ -z $CLIENT ]]; then
  # If the user doesn't exist, insert them into the database
  $PSQL "INSERT INTO users(name) VALUES('$USER_NAME')" >/dev/null
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
else
  # If the user exists, fetch their game history
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM number_guesses WHERE user_id=$CLIENT")
  BEST_GAME=$($PSQL "SELECT MIN(num_before_guess) FROM number_guesses WHERE user_id=$CLIENT")

  # Display the welcome back message with game history
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Start the number guessing game
echo -e "\nGuess the secret number between 1 and 1000:"
RANDOM_NUMBER=$((1 + RANDOM % 1000))
COUNT=0

while true; do
  read NUMBER

  # Validate input: ensure it's a positive integer
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  COUNT=$((COUNT + 1))

  if [[ $NUMBER -lt $RANDOM_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $NUMBER -gt $RANDOM_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
    # Insert the game result into the database
    $PSQL "INSERT INTO number_guesses(user_id, num_before_guess) VALUES($CLIENT, $COUNT);" >/dev/null
    break
  fi
done