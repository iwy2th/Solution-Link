#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
$PSQL "TRUNCATE games, teams"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT POINT1 POINT2
do 

if [[ "$YEAR" != "year" && "$ROUND" != "round" && "$WINNER" != "winner" && "$OPPONENT" != "opponent" && "$POINT1" != "winner_goals" && "$POINT2" != "opponent_goals" ]] 
then
    CHECK=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    CHECK2=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    # echo $CHECK $CHECK2 
    if [[ -z "$CHECK" ]] 
    then
      $PSQL "INSERT INTO teams(name) VALUES('$WINNER')"
    fi
    if [[ -z "$CHECK2" ]] 
    then
      $PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')" 
    fi
  CHECK=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  CHECK2=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
  echo $YEAR $ROUND $CHECK $CHECK2 $POINT1 $POINT2
  $PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES('$YEAR', '$ROUND', '$POINT1', '$POINT2', '$CHECK', '$CHECK2')"
fi

done 