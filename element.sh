#!/bin/bash 
if [[ $1 ]] 
then 
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
  #check input exit in database 
  if [[ $1 =~ ^-?[0-9]+$ ]]; then
    DATA=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1;")
  else 
    DATA=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1' OR name = '$1';")
  fi

  if [[ -z $DATA ]]; then
    echo "I could not find that element in the database."
  else
    IFS='|' read -r atomic_number symbol name type atomic_mass melting_point boiling_point <<< "$DATA"
    echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
  fi
else 
  echo "Please provide an element as an argument."
fi