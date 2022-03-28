*** Settings ***
Documentation    Automated tests for shopping cart functionality
Library    SeleniumLibrary

*** Test Cases ***
Adding Product To Shopping Cart Should Increase Products Amount
    Open Browser    http://localhost/    firefox
    Check If Shopping Cart Is Empty
    Go To Product View
    Add Product To Shopping Cart
    Check If Shopping Cart Has 1 Product
    Close Browser

