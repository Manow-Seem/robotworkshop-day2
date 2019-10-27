*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Add product to shopping cart
    [Arguments]    ${product id}
     Mouse Over     xpath:(//div[@class="product-image-container"])[${product id}]
     click link       css:ul#homefeatured a[data-id-product="${product id}"]

Checkout product
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5s 
    click link       css:a[title="Proceed to checkout"]