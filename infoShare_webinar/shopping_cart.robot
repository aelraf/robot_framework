*** Settings ***
Documentation    Automated tests for shopping cart functionality
Library    SeleniumLibrary

# zwiększamy przeglądarkę na całą stronę - na początku testu
Test Setup    Maximize Browser Window


*** Variables ***
${CART_ITEMS_AMOUNT}    //span[@id='numItemsInCart']
${PRODUCT_VIEW}         //a[contains(text(),'Colorful')]
${ADD_TO_CART_BUTTON}   //a[@id='buttonCart']


*** Test Cases ***
Adding Product To Shopping Cart Should Increase Products Amount
    [Setup]    Open Shop Webpage
    Check If Shopping Has 0 Product
    Go To Product View
    Add Product To Shopping Cart
    Check If Shopping Cart Has 1 Product
    [Teardown]    Close Browser


*** Keywords ***
Prepare Env
    Set Selenium Speed    0.5
    Set Screenshot Directory    screenshots

Open Shop Webpage
    Open Browser    http://localhost/    firefox

Check If Shopping Cart Has ${amount} Product
    Wait Until Element Contain    ${CART_ITEMS_AMOUNT}    ${amount} items in cart

Go To Product View
    Click Element    ${PRODUCT_VIEW}

Add Product To Shopping Cart
    Click Element    ${ADD_TO_CART_BUTTON}


