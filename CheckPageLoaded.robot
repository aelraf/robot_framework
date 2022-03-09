*** Settings ***
Documentation    Suite description


*** Variables ***
${URL} https://www.jcommerce.pl/
${BROWSER} Chrome
${DRIVER_EXECUTABLE} Drivers/chromedriver.exe
${LOGO_XPATH} //header//leg


*** Keywords ***
user has accessed the website
    Open browser    ${URL}  ${BROWSER}  executable_path ${DRIVER_EXECUTABLE}
    wait until alement is visible   ${LOGO_XPATH}


*** Test Cases ***
Check main page
    Given User has accessed the website
    Then title should be    JCommerce,  Outsorcing
    And close browser

Check main page second time
    [Setup]     User has accessed the website
    title should be     JCommerce   outsorcing
    [Teardown]  close browser