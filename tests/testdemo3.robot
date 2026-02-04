*** Settings ***
Documentation    To validate the login form
Library          SeleniumLibrary
Library          String
Library          Collections
Test Setup       open the browser with the url    Edge
Test Teardown    Close Browser
Resource         ../PO/Generic.robot
*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Shop_page_load}             css:.nav-link
*** Test Cases ***
Validate Child window Functionality
    [Tags]        NEWFEATURE
    Select the link of Child window
    Verify the user is Switched to Child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email

*** Keywords ***
Select the link of Child window
    Click Element    css:.blinkingText
    Sleep            5

Verify the user is Switched to Child window
    switch window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the Email id in the Child Window
    ${text}=    get text    css:.red
    @{words}=    Split String    ${text}    at
    #0 -> Please email u
    #1 -> mentor@rahulshettyacademy.com with below template to receive response
    ${text_split}=    Get From List    ${words}    1
    log    ${text_split}
    @{words_2}=    Split String    ${text_split}
    #0->mentor@rahulshettyacademy.com 
    ${email}=    Get From List    ${words_2}    0
    Set Global Variable    ${email}

Switch to Parent window and enter the Email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text        id:username    ${email}


       


