Description: Task 2.4 - Verify items can be sorted using different options

Scenario: Verify sorting products by "Price: Low to High"
Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
When I select `Price: Low to High` in dropdown located by `id(products-orderby)`
When I save text of element located by `xpath((//span[@class='price actual-price'])[1])` to scenario variable `first-price-low-to-high`
When I select `Price: High to Low` in dropdown located by `id(products-orderby)`
When I save text of element located by `xpath((//span[@class='price actual-price'])[1])` to scenario variable `first-price-high-to-low`
Then `${first-price-low-to-high}` is not equal to `${first-price-high-to-low}`
