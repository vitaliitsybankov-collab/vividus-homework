Description: Task 2.5 - Verify the number of items displayed per page can be changed
!-- Uses a relative comparison (more items shown at a larger page size) rather than a
!-- hardcoded expected count, since the /desktops category has fewer than 8 total
!-- products - asserting an exact count of 8 fails regardless of whether the feature
!-- actually works.

Scenario: Verify changing the page size updates the number of displayed items
Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
When I select `4` in dropdown located by `id(products-pagesize)`
Then number of elements found by `xpath(//div[contains(@class,'item-box')])` is equal to `4`
When I select `8` in dropdown located by `id(products-pagesize)`
Then number of elements found by `xpath(//div[contains(@class,'item-box')])` is greater than `4`
