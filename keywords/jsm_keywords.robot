*** Settings ***
Library          Selenium2Library   timeout=0.5
Resource         ../variable/jsm_variables.robot

*** Keywords ***
Open JSM Website
    Open Browser   ${jsm_url}  ${BROWSER}
    Maximize Browser Window

Select Category
    [Arguments]    ${category}
    Wait Until Element Is Enabled   ${product_link}
    Click Element   ${product_link}
    Click Element   ${category}

Select Product
    [Arguments]    ${item}   ${item_value}
    Wait Until Element Is Enabled   xpath=//a[contains(text(),'ALL PRODUCTS')]
    Set Selenium Implicit Wait  3 seconds
    Click Image  ${item}
    Click Element  ${select_item_option}
    Click Element  ${item_value}
    # Focus
    Click Element  xpath=(//div[@id='ju-content'])[3]
    # Execute Javascript    window.scroll(0,184)

Check Out Cart
    Set Selenium Implicit Wait  5 seconds
    Click Element  ${add_to_cart__button}
    Set Selenium Implicit Wait  5 seconds
    Click Element  ${checkout_button}
    Minimize Browser Window
    press keys  none  ARROW_DOWN
    press keys  none  ARROW_DOWN
    Click Element  ${submit_button}

Verify Order Confirmation page
    Wait Until Element Is Enabled   xpath=//a[contains(text(),'ยืนยันการชำระเงิน')]
    Page Should Contain Element   xpath=//p[contains(.,'ยืนยันการชำระเงิน')]
    Page Should Contain Element   xpath=//div[contains(.,'เลขที่คำสั่งซื้อสินค้า:')]\
    Page Should Contain Element   xpath=//div[contains(.,'วันที่สั่งซื้อ:')]
    # check order id and date
    Page Should Contain Element   css=div:nth-child(1) > span
    Page Should Contain Element   css=div:nth-child(2) > span
