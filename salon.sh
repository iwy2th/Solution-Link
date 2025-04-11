#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c "
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]] 
  then
    echo -e "\n$1"
  fi 
  echo -e "Welcome to My Salon, how can I help you?\n"
  sv=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
  echo "$sv" | while read SERVICE_ID BAR NAME
  do
    echo -e "$SERVICE_ID) $NAME"
  done 
  read SERVICE_ID_SELECTED 
  NAME_sv=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
  case $SERVICE_ID_SELECTED in 
  1) SERVICE_MENU "$NAME_sv" "$SERVICE_ID_SELECTED";;
  2) SERVICE_MENU "$NAME_sv" "$SERVICE_ID_SELECTED";;
  3) SERVICE_MENU "$NAME_sv" "$SERVICE_ID_SELECTED";;
  4) SERVICE_MENU "$NAME_sv" "$SERVICE_ID_SELECTED";; 
  5) SERVICE_MENU "$NAME_sv" "$SERVICE_ID_SELECTED";; 
  *) MAIN_MENU "I could not find that service. What would you like today?";; 
  esac
}   


SERVICE_MENU() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE 
  if [[ ! $CUSTOMER_PHONE =~ ^([0-9]+-)*[0-9]+$ ]]
  then 
    SERVICE_MENU "What's your phone number?"
  fi 
  CHECK_PHONE=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  if [[ -z $CHECK_PHONE ]] 
  then 
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME 
    INSERTED=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME');")
  fi 
  SV_NAME_FM=$(echo $1 | sed 's/ //g')
  CUSTOMER_NAME_FM=$(echo $CUSTOMER_NAME | sed 's/ //g')
  echo -e "\nWhat time would you like your $SV_NAME_FM, $CUSTOMER_NAME_FM?"
  read SERVICE_TIME

  SV_ID=$($PSQL "SELECT service_id FROM services WHERE name = '$SV_NAME_FM';") 
  CUSTOMER_ID_RS=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';") 
  RS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID_RS', '$SV_ID','$SERVICE_TIME');")

  echo -e "\nI have put you down for a $SV_NAME_FM at $SERVICE_TIME, $CUSTOMER_NAME_FM."
}


MAIN_MENU