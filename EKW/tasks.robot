# https://robocorp.com/docs/courses/beginners-course/your-first-robot
*** Settings ***
Documentation    Template robot main suite.
Documentation     Insert the sales data for the week and export it as a PDF.

Library    RPA.Browser.Selenium


*** Tasks ***
Minimal Task
    Log    Done.

Insert The Sales Data For The Week And Export It As PDF
    Open the intranet website


*** Keywords ***
Open the intranet website
