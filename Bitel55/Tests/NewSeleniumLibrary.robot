*** Settings ***
Resource  Settings/Keyword.robot
# te biblioteki są po to, żeby robot mógł pracować w instancji przeglądarki wspólnie z pythonem
Library  Libraries/NewSeleniumLibrary.py
Library  Libraries/GetRobotValue.py


*** Variables ***
${HIDDEN_VARIABLE}  I'm not here!


*** Test Cases ***
Check if email is correct
    User has accessed the website
    ${EMAIL}  get email
    log to console  ${EMPTY}
    log to console  get email
    log to console  ${EMAIL}
    should be equal as string  ${EMAIL}   office@jcommerce.pl
    close browser



