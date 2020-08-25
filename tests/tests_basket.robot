*** Settings ***
Library    String
Library    Collections
Library    Selenium2Library
Test Setup    Open Browser and go to Page
Test Teardown    Close Browser and Capture Screenshot
Resource    ../resources/variables.robot
Resource    ../resources/keywords.robot                

*** Test Cases ***
Go to Notebook Category Find 2 Most Expensive Items on Current Page and Add Them to Basket    
    Go To Category    ${category_btn_tag}    ${category_assert}    
    Find nth Most Expensive Item and Add it    1
    Return Back to Item List
    Find nth Most Expensive Item and Add it    2
    Continue to Basket
    
Go to Notebook Category Sort by Price and Add 2 Most Expensive Items to Basket
    Go To Category    ${category_btn_tag}    ${category_assert}
    Sort Items by Price
    Add nth Item    1
    Return Back to Item List
    Add nth Item    2
    Continue to Basket
