*** Settings ***
Resource   Settings/Keywords.robot


*** Test Cases ***
User write something into search
    Given User has accessed the website
    When User clicked search button
    And User write something into search
    Then Search value should be  something
    And There should be something in search field
    And close browser
