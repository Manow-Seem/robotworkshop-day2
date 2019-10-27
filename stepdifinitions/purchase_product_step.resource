*** Settings ***
Library           SeleniumLibrary
Resource    ../resources/Homepage.resource
Resource    ../resources/Orderpage.resource

*** Keywords ***
Unauthen user add product "${product id}" to shipping cart
    HomePage.Add product to shopping cart    ${product id}
   
I checkout product
    HomePage.Checkout product

I Should see total product price equal to "${shipping_price}"
    OrderPage.Wait Until Page load success
    OrderPage.Verify total product price    ${shipping_price}
    