*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource         Generic.robot
*** Variables ***
${Error_Message_Login}        css:.alert-danger

*** Keywords ***

Fill the login Form
    [arguments]    ${username}    ${password}
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button      signInBtn

wait until Element is located in the page
    Wait Until Element Is Visible        ${Error_Message_Login}

verify error message is correct
    ${result}=    Get Text    css:.alert-danger
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be        ${Error_Message_Login}        Incorrect username/password.

Fill the Login Details and Login Form
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    Learning@830$3mK2
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Click Element    okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    terms
    Checkbox Should Be Selected    terms
