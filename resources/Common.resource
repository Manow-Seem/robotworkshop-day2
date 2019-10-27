*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Target URL}    http://automationpractice.com/index.php    
${Browser}    gc    

*** Keywords ***
Ecommerce Suite Setup
    Open Browser        ${Target URL}     ${Browser}
    Maximize Browser Window
    
Ecommerce Suite Test Teardown
    Close All Browsers
    
Ecommerce Test Setup
    Delete All Cookies
    Go to     ${Target URL}
    