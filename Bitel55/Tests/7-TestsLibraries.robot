*** Settings ***
Library    Libraries/SecondTestClass.py
Library    Libraries/FirstTestClass.py  WITH NAME  first
Library    Libraries/FirstTestClass.py  WITH NAME  first_again

*** Test Cases ***
Check creation
    log to console   I'm here!

