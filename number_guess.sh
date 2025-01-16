#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USER_NAME

# Corrected regex syntax for 22-character username
if [[ ! $USER_NAME =~ ^[A-Za-z]{22}$ ]]; then
  echo "Enter a username that is exactly 22 characters."
  exit 0
fi

CLIENT=$($PSQL "SELECT user_id FROM users WHERE name='$USER_NAME'")
if [[ -z $CLIENT ]]
then
  $PSQL "INSERT INTO users(name) VALUES('$USER_NAME')"
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  CLIENT=$($PSQL "SELECT user_id FROM users WHERE name='$USER_NAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM number_guesses WHERE user_id=$CLIENT")
  BEST_GAME=$($PSQL "SELECT MIN(num_before_guess) FROM number_guesses WHERE user_id=$CLIENT")
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
RANDOM_NUMBER=$((1 + RANDOM % 1000))
COUNT=0

while true; do
  read NUMBER

  # Validate input: ensure it's a positive integer
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]; then
    echo "That is not a valid positive integer, guess again:"
    continue
  fi

  COUNT=$((COUNT + 1))

  if [[ $NUMBER -lt $RANDOM_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $NUMBER -gt $RANDOM_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
    $PSQL "INSERT INTO number_guesses(user_id, num_before_guess) VALUES($CLIENT, $COUNT);"
    break
  fi
done