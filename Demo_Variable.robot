*** Test Cases ***
Demo Scalar
    [Documentation]     
    ...    This test case for demo scalar
    ...    Try to set test variable 
    ${username}    Set variable    มะนาว
    ${surname}    BuiltIn.Set Variable     Deo
    Log    Hello ${username} and ${surname} 
    Log    Hi ${username}
    ${nickname}    Set variable    Mr 3
    
Demo List
    @{product name}    create List   Iphone11    Android 12    Window phone
    Log Many    @{product name}
    Log    ${product name[1]}

Demo Dictionary
   &{user1}    Create dictionary    username=john    password=welcom1
   &{user2}    Create dictionary    username=mary    password=welcom2
   Log    ${user1.username}
   Log    ${user2.password}    

Demo set keywords
    ${hi} =     Set Variable  Hello, world!   
    ${hi2} =     Set Variable  I said:  ${hi}   
    ${var1}    ${var2} =     Set Variable  Hello world 
    @{list} =     Set Variable  ${list with some items}  

