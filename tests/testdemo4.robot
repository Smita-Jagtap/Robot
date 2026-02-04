*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary
Test Teardown    Close Browser
Test Template    Validate UnSuccessful Login
*** Variables ***
${Error_Message_Login}        css:.alert-danger


*** Test Cases ***    username        password
Invalid username      dsahed          learning
Invalid password      rahulshetty     ploudfg
special characters    @#$             learning


*** Keywords ***
Validate UnSuccessful Login
    [Arguments]        ${username}        ${password}
    open the browser with the Mortgage payment url
    Fill the login Form    ${username}    ${password}
    wait until it checks and display error message
    verify error message is correct

open the browser with the Mortgage payment url
    Create WebDriver    Chrome
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    [arguments]    ${username}    ${password}
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button      signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
    ${result}=    Get Text    css:.alert-danger
    Should Be Equal As Strings  ${result}    Incorrect username/password.
    Element Text Should Be        ${Error_Message_Login}        Incorrect username/password.



