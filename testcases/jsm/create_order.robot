*** Settings ***
Documentation    Test Make Order JSM
Library          Selenium2Library
Resource         ../../keywords/jsm_keywords.robot
Suite Setup     Open JSM Website
Suite Teardown  Close Browser

*** Test Cases ***
Open Web
    [Tags]    Test
    Select Category  xpath=//a[contains(text(),'BASE')]
    Select Product  xpath=(//img[@alt='product'])[1]   xpath=//option[@value='200']
    Check Out Cart
    Verify Order Confirmation page
