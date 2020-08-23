*** Settings ***
Library    String
Library    Collections
Library    Selenium2Library
Resource    variables.robot

*** Keywords ***
Open Browser and go to Page
    Set Screenshot Directory    screenshots
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    
Close Browser and Capture Screenshot
    Capture Page Screenshot
    Close Browser