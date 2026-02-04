*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...              
...              The system specific keywords created here form our own
...              domain specific language. They utilize keywords provided
...              by the imported SeleniumLibrary.
Library          SeleniumLibrary

*** Variables ***
${user_name}           rahulshettyacademy
${invalid_password}    12345
${valid_password}      Learning@830$3mK2
${url}                 https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
#open the browser with the Mortgage payment url
#    Create WebDriver    Edge
#    Go To  ${url}

    
open the browser with the url
    [arguments]    @{browser_name}
    Create WebDriver    @{browser_name}
    Go To    ${url}

Close Browser session
    Close Browser

Wait Until element passed is located on Page
    [arguments]        ${page_locator}
    Wait Until Element Is Visisble        ${page_locator}
