*** Settings ***
Library    Dialogs    

*** Test Cases ***
Demo pause doalog
    Log    Step1
    Dialogs.Pause Execution    Test pause
    Log    Step2