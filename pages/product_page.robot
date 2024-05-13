*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${product_page_product_name}    css=[data-test="inventory-item-name"]
${product_page_product_price}    css=[data-test="inventory-item-price"]
${product_page_btn_add_to_cart}    css=[data-test="add-to-cart"]

*** Keywords ***
Clicar no Botão "Add to cart"
    Click Button    ${product_page_btn_add_to_cart}
    