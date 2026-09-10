#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo -e "\nNumber Guess\n"

MAIN_MENU() {
  echo "Enter your username: "
  read USN

  FOUND=$($PSQL "select * from number_guess where username = '$USN'")
  if [[ -z $FOUND ]]; then 
    INS_USN=$($PSQL "insert into number_guess (username, games, guess) values ('$USN', 0, 1000000)")
    echo "Welcome, $USN! It looks like this is your first time here."
  else
   IFS='|' read id username games guess <<< $FOUND 
   echo -e "Welcome back, $USN! You have played $games games, and your best game took $guess guesses."
  fi 

  CNT=0
  RND=$((RANDOM % 1000 + 1))
  GAME "Guess the secret number between 1 and 1000:" $RND $CNT
 }

GAME() {
 count=$3
 echo $1 
 read GSS
 if [[ -z $GSS ]]; then
  GAME "That is not an integer, guess again:" $2 $count
 elif ! [[ $GSS =~ ^[0-9]+$ ]]; then
  GAME "That is not an integer, guess again:" $2 $count
 elif [ "$GSS" -gt "$2" ]; then 
   (( count++ ))
   GAME "It's higher than that, guess again:" $2 $count
 elif [ "$GSS" -lt "$2" ]; then 
   (( count++ ))
   GAME "It's lower than that, guess again:" $2 $count
 else
   (( count++ ))
   echo "You guessed it in $count tries. The secret number was $2. Nice job!" 
   UPD_GM=$($PSQL "update number_guess set games = games + 1 where username = '$USN'")
   GUESS=$($PSQL "select guess from number_guess where username = '$USN'")
   if (( count < GUESS )); then
     UPD_GS=$($PSQL "update number_guess set guess = $count where username = '$USN'")
   fi 
 fi
}

MAIN_MENU
