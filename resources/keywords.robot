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
    
Go To Category
    [arguments]    ${category_btn}    ${category_assert}    
    Click Element    ${category_btn}
    Wait Until Element Contains    ${category_assert_tag}    ${category_assert}
    
Find nth Most Expensive Item and Add it
    [arguments]    ${n}
    Wait Until Page Contains Element    ${item_price_tag}             
    ${nth_price_index}=    Find Element with nth Highest Price    ${item_price_tag}    ${n}
    Wait Until Page Contains Element    ${item_add_tag}   
    ${add_item_btns_list}=    Get WebElements    ${item_add_tag}
    ${add_item_btn}=    Get From List    ${add_item_btns_list}    ${nth_price_index}
    Click Element    ${add_item_btn}
    Wait Until Element Contains    ${add_item_assert_tag}    ${add_item_assert}            
            
Find Element with nth Highest Price
    [arguments]    ${elements_tag}    ${n}
    ${element_list}=    Get WebElements    ${elements_tag}
    ${element_count}=    Get Element Count    ${elements_tag}            
    ${value_list}=    Create List
    FOR    ${i}    IN RANGE    0    ${element_count}
         ${current_element}=    Get From List    ${element_list}    ${i}
         ${text}=    Get Text    ${current_element}
         ${trimmed_text}=    Fetch From Left    ${text}    ,
         ${value}=    Convert to Integer    ${trimmed_text}
         Append To List    ${value_list}    ${value}
    END    
    ${value_list_sort}=    Copy List    ${value_list}
    Sort List    ${value_list_sort}
    ${max_index}=    Evaluate    ${element_count} - ${n}
    ${max_value}=    Get From List    ${value_list_sort}    ${max_index}
    ${max_index}=    Get Index From List    ${value_list}    ${max_value}        
    [return]    ${max_index}                    

Sort Items by Price
    Wait Until Page Contains Element    ${sort_price_btn}    
    Click Element    ${sort_price_btn}
    Wait Until Element Is Not Visible    ${circle_loader_tag}

Add nth Item
    [arguments]    ${n}
    Wait Until Page Contains Element    ${item_add_tag}   
    ${add_item_btns_list}=    Get WebElements    ${item_add_tag}
    ${n}=    Evaluate    ${n} - 1
    ${add_item_btn}=    Get From List    ${add_item_btns_list}    ${n}
    Click Element    ${add_item_btn}
    Wait Until Element Contains    ${add_item_assert_tag}    ${add_item_assert}

Return Back to Item List
    Wait Until Page Contains Element    ${basket_return_btn}    
    Click Element    ${basket_return_btn}
    
Continue to Basket
    Wait Until Page Contains Element    ${basket_continue_btn}
    Click Element    ${basket_continue_btn}
    
Check Number of Items in Basket
    [arguments]    ${n}
    Wait Until Element Contains    ${basket_assert_tag}    ${basket_assert}
    Wait Until Page Contains Element    ${basket_items_assert_tag}    
    Page Should Contain Element    ${basket_items_assert_tag}    ${n}
