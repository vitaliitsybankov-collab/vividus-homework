Description: Task 1.9 - Verify the ability to download a report
!-- KNOWN ISSUE (see known-issues.json, key "epam-corporate-overview-report-removed"):
!-- The hometask specifies downloading the "EPAM Corporate Overview 2023" report from
!-- the "EPAM at a Glance" section. As of the current live site, no report by this name
!-- exists anywhere on /about - the only PDFs present are the UK Modern Slavery
!-- Statement, Code of Ethical Conduct, and a Nordic Sustainability report. This
!-- indicates EPAM discontinued or relocated this specific report since the hometask
!-- was authored, not a locator defect. Left active (not @skip) so it runs and
!-- produces real evidence of the missing report, classified as a Known Issue.

Scenario: Verify the "EPAM Corporate Overview" report is available to download
Given I am on page with URL `https://www.epam.com/about`
Then number of elements found by `xpath(//a[contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'corporate overview')])` is greater than or equal to `1`
