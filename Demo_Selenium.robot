*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Target URL}    http://automationpractice.com/index.php    
${Browser}    gc    

*** Test Cases ***
#Open Browser demo 
    #Open Browser        ${Target URL}     ${Browser}
    
#Test case 2
    #Log    ${Target URL}
    
Test Id locator
    Open Browser        ${Target URL}     ${Browser}
    Click Element       id:contact-link
    page Should Contain    send a message
    
Test CSS locator
    Open Browser        ${Target URL}     ${Browser}
    Click Element       css:a.login
    page Should Contain    Already registered\?