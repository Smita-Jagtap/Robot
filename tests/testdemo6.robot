*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary
Library    Collections
Library    ../customLibraries/Shop.py
#Test Setup    open the browser with the Mortgage payment url
Test Setup    open the browser with the url    Edge
#Suite Setup      Set Selenium Timeout    20s
#Suite Teardown
#Test Teardown    Close Browser session
Resource        ../PO/Generic.robot
Resource        ../PO/LandingPage.robot
Resource        ../PO/ShopPage.robot
Resource        ../PO/CheckoutPage.robot
Resource        ../PO/ConfirmationPage.robot
*** Variables ***
${listofProducts}             Nokia Edge    Blackberry
${country_name}               India
*** Test Cases ***
Validate UnSuccessful Login
    [Tags]    smoke
    LandingPage.Fill the login Form    ${user_name}    ${invalid_password}
    LandingPage.wait until Element is located in the page
    LandingPage.verify error message is correct

Validate Cards display in the Shopping Page
    [Tags]    regression
    LandingPage.Fill the login Form    ${user_name}    ${valid_password}
    ShopPage.wait until Element is located in the page
    ShopPage.Verify card titles in the Shop page
    #hello world
    add items to cart and checkout    ${listofProducts}
    CheckoutPage.Verify items in the Checkout Page and proceed
    ConfirmationPage.Enter the Country and select the terms       ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase
    #Select the card    Nokia Edge

#Select the Form and navigate to Child window
#    LandingPage.Fill the Login Details and Login Form

