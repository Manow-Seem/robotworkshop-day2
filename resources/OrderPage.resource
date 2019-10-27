*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Wait Until Page load success
    Wait Until Page Contains    Shopping-cart summary    5s
    
Verify total product price
     [Arguments]    ${product_price}
    ${total_product_price} =    Get Text    id:total_product
    Should be Equal As Strings        ${product_price}    ${total_product_price}   
    
Verify shipping product price
    [Arguments]    ${shipping_price}
    ${total_shipping_price} =    Get Text    id:total_shipping
    Should be Equal As Strings        ${shipping_price}    ${total_shipping_price}
     
Verify total price
    [Arguments]    ${total_price}
     ${total_price} =    Get Text    id:total_price
     Should be Equal As Strings        ${total_price}    ${total_price}
     
Summarry total price
     # $12.21
     ${total product} =    Get Text    id:total_product
     #12.21
     ${total product} =    Replace String    ${total product}    $    ${EMPTY}
      #12.21
     ${total product} =    Convert to Number    ${total product}
     

     ${total shipping} =    Get Text    id:total_shipping
     ${total shipping} =    Replace String     ${total shipping}    $    ${EMPTY}
     ${total shipping} =    Convert to Number    ${total shipping}
     

     ${total tax} =    Get Text    id:total_tax
     ${total tax} =    Replace String     ${total tax}    $    ${EMPTY}
     ${total tax} =    Convert to Number    ${total tax}
     

     ${total price} =    Get Text    id:total_price
     ${total price} =    Replace String     ${total price}    $    ${EMPTY}
     ${total price} =    Convert to Number    ${total price}
     
     ${expect total price} =    Evaluate    ${total product} + ${total shipping} + ${total tax}
     Should Be Equal As Numbers     ${expect total price}    ${total price}
     
