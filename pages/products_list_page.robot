*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${products_list_page_header}    css=[data-test="title"]

*** Keywords ***
Clicar no Produto
    [Arguments]    ${product_name}
    Click Element    css=img[alt="${product_name}"]