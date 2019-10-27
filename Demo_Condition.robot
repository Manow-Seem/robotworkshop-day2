*** Test Cases ***
IF ELSE condition
    [Documentation]
    ...    My student grades
    ...    >= 80 = A
    ...    70 - 79 = B
    ...    60 - 69 = C
    ...    50 - 59 = D
    ...    50<     = F
    @{student grades} =  create List    23    67    80    99
    FOR    ${grade}    IN    @{student grades}
        Log    ${grade}
        ${actual grade} =     Get student grade based on score    ${grade}
        Log      ${actual grade}

        #Log student grade based on score    ${grade}
                        #condition  name
        #Run keyword if    ${grade} >= 80    Log    A
        #...    ELSE IF    70 <= ${grade} <= 79    Log    B
        #...    ELSE IF    60 <= ${grade} <= 69    Log    c
        #...    ELSE IF    50 <= ${grade} <= 59    Log    D
        #...    ELSE    Log    F
        
        #Run keyword if    70 <= ${grade} <= 79    Log    B
        #Run keyword if    60 <= ${grade} <= 69    Log    c
        #Run keyword if    50 <= ${grade} <= 59    Log    D
        #Run keyword if    ${grade} < 50    Log    F  
        
    END
    
*** Keywords ***
Get student grade based on score
    [Arguments]    ${score}
    [Return]       ${grade}
    ${grade} =    set variable    F
    ${grade} =    set variable if     ${score} >= 80    A    ${grade}
    ${grade} =    set variable if    70 <= ${score} <= 79    B    ${grade}
    ${grade} =    set variable if    60 <= ${score} <= 69    C    ${grade}
    ${grade} =    set variable if    50 <= ${score} <= 59    D    ${grade}
    ${grade} =    set variable if     ${score} < 50    F    ${grade}
    

Log student grade based on score
    [Arguments]    ${score}
    
     ${grade} =    set variable    F
    Run keyword if    ${score} >= 80    Log    A
        ...    ELSE IF    70 <= ${score} <= 79    Log    B
        ...    ELSE IF    60 <= ${score} <= 69    Log    c
        ...    ELSE IF    50 <= ${score} <= 59    Log    D
        ...    ELSE    Log    F
    