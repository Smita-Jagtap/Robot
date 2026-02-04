*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary
Library    Collections
Test Setup        open the browser with the url    Edge
#Test Teardown    Close Browser session
Resource          ../PO/Generic.robot
*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Shop_page_load}             css:.nav-link

*** Test Cases ***
Validate UnSuccessful Login
    Fill the login Form    ${user_name}    ${invalid_password}
    wait until Element is located in the page    ${Error_Message_Login}
    verify error message is correct

Validate Cards display in the Shopping Page
    [tags]    smoke
    Fill the login Form    ${user_name}    ${valid_password}
    wait until Element is located in the page    ${Shop_page_load}
    Verify card titles in the Shop page
    Select the card    Nokia Edge

Select the Form and navigate to Child window
    Fill the Login Details and Login Form

***Keywords***

Fill the login Form
    [arguments]    ${username}    ${password}
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button      signInBtn

wait until Element is located in the page
    [arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct
    ${result}=    Get Text    css:.alert-danger
    Should Be Equal As Strings  ${result}    Incorrect username/password.
    Element Text Should Be        ${Error_Message_Login}        Incorrect username/password.

Verify Card titles in the Shop page
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =    Get WebElements    css:.card-title
    @{actualList} =    Create List
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}

    END
    Lists Should Be Equal    ${expectedList}    ${actualList}

Select the Card
    [arguments]    ${cardName}
    ${elements} =    Get Webelements    css:.card-title
    ${index} =    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
        ${index} =    Evaluate    ${index} + 1
    END
    Click Button   xpath:(//*[@class='card-footer'])[${index}]/button

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
