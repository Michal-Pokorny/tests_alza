*** Variables ***
${url}    https://www.alza.cz/
${browser}    chrome
${category_btn_tag}    id:litp18842920
${category_assert}    Notebooky
${category_assert_tag}    xpath://h1[@itemprop="name"]    
${item_price_tag}    css:.price .c2
${item_add_tag}    css:.browsingitemcontainer .browsingitem .btnk1
${add_item_assert_tag}    css: .basket
${add_item_assert}    Zboží bylo přidáno do košíku
${basket_return_btn}    id:varABackButton
${basket_continue_btn}    id:varAToBasketButton
${basket_assert}    Košík
${basket_assert_tag}    css:#ordernav .first strong
${basket_items_assert_tag}    css:table.o1grid tr[data-code]
${sort_price_btn}    css:[aria-controls="cenadesc"]
${circle_loader_tag}    css:.circle-loader-container
