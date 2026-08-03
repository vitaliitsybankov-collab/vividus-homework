Description: Task 1.4 - Verify the policies list in the footer

Scenario: Verify footer contains the expected list of policies
Given I am on page with URL `https://www.epam.com`
When I change context to element located by `tagName(footer)`
When I scroll context to BOTTOM edge
Then text `INVESTORS` exists
Then text `COOKIE POLICY` exists
Then text `OPEN SOURCE` exists
Then text `APPLICANT PRIVACY NOTICE` exists
Then text `PRIVACY POLICY` exists
Then text `WEB ACCESSIBILITY` exists
