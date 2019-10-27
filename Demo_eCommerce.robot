*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    resources/Common.resource
Suite Setup    Ecommerce Suite Setup
Suite Teardown    Ecommerce Suite Test Teardown



*** Variables ***
${Target URL}    http://automationpractice.com/index.php    
${Browser}    gc    

*** Test Cases ***
Normal User checkout single product should calculate total price and shipping fee correctly 
     Mouse Over     xpath:(//div[@class="product-image-container"])[1]

     click link       css:ul#homefeatured a[data-id-product="1"]
     #Sleep    3s
     Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5s 
     click link       css:a[title="Proceed to checkout"]
     Wait Until Page Contains    Shopping-cart summary    5s
     ${total_product_price} =    Get Text    id:total_product
     Should be Equal As Strings        $16.51    ${total_product_price}    
     
     ${total_shipping_price} =    Get Text    id:total_shipping
     Should be Equal As Strings        $2.00    ${total_shipping_price}
     
     ${total_price} =    Get Text    id:total_price
     Should be Equal As Strings        $18.51    ${total_price}

     #remove$
     ${total_price} =    Replace String    ${total_price}    $    ${EMPTY}
     Should be Equal As Strings        18.51    ${total_price}
     
Normal User checkout multiple product should calculate total price and shipping fee correctly
    Mouse Over     xpath:(//div[@class="product-image-container"])[1]
    click link       css:ul#homefeatured a[data-id-product="1"] 
    #Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5s 
    #click link       css:a[title="Proceed to checkout"]    