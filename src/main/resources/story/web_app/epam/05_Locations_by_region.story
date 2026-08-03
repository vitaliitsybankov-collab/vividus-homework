Description: Task 1.5 - Verify the ability to switch location lists by region

Scenario: Verify three regions are presented and switchable
Given I am on page with URL `https://www.epam.com`
Then number of elements found by `xpath(//*[contains(text(),'AMERICAS')])` is greater than or equal to `1`
Then number of elements found by `xpath(//*[contains(text(),'EMEA')])` is greater than or equal to `1`
Then number of elements found by `xpath(//*[contains(text(),'APAC')])` is greater than or equal to `1`

Scenario: Verify switching to EMEA region shows corresponding locations
When I click on element located by `xpath(//*[contains(text(),'EMEA')])`
Then text `Poland` exists
