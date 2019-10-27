*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../resources/Homepage.resource
Resource    ../resources/Common.resource
Resource    ../resources/Orderpage.resource
Resource    ../stepdifinitions/purchase_product_step.resource
Suite Setup    Ecommerce Suite Setup
Test Setup     Ecommerce Test Setup
Suite Teardown    Ecommerce Suite Test Teardown

*** Test Cases ***
Test import selenium resource file
     Mouse Over       xpath:(//div[@class="product-image-container"])[1]
     click link       css:ul#homefeatured a[data-id-product="1"]
     
Demo page resource Verify add single product
     HomePage.Add product to shopping cart    1
     HomePage.Checkout product
     OrderPage.Wait Until Page load success
     OrderPage.Verify total product price    $16.51
     OrderPage.Verify shipping product price    $2.00
     OrderPage.Verify total price    $18.51
     OrderPage.Summarry total price

Demo math
    ${result}    Evaluate    2+10
    
Unauthen user checkout single product should calculate total price and shipping fee
        #[TAGE]  ignore
        Given Unauthen user add product "1" to shipping cart
        And Unauthen user add product "2" to shipping cart
        When I Checkout product
        Then I Should see total product price equal to "$16.51"
        #And I Should see shipping product price equal to "$2.00"
        #And I Should see total price equal to "$18.51"
        #And I Should see total price equal to summary price
     
     
