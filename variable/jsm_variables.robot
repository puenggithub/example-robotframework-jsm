*** Variables ***
${BROWSER}      Firefox
${jsm_url}      http://13.250.139.89/
${product_link}      xpath=//a[contains(text(),'PRODUCT')]
${category_link}     xpath=//a[contains(text(),'BASE')]
${select_item_option}  css=#option_product
${select_item_alue}  xpath=//option[@value='1']
${add_to_cart__button}   xpath=//button[@value='Add to Cart']
${checkout_button}  css=.wc-proceed-to-checkout > #productForm .text-thai
${submit_button}    xpath=//form[@id='productForm']/div/button/b
