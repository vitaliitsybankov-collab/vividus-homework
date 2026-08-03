Description: Task 2.3 - Verify the 'Computers' category contains three sub-categories with correct names

Scenario: Verify Computers category sub-categories
Given I am on page with URL `https://demowebshop.tricentis.com/computers`
Then number of elements found by `xpath(//div[@class='sub-category-item'])` is equal to `3`
Then text `Desktops` exists
Then text `Notebooks` exists
Then text `Accessories` exists
