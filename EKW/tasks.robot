# https://robocorp.com/docs/courses/beginners-course/your-first-robot
# https://rpaframework.org/
*** Settings ***
# Documentation    Template robot main suite.
Documentation    Insert the sales data for the week and export it as a PDF.

Library    RPA.Browser.Selenium    auto_close=${FALSE}


*** Tasks ***
Minimal Task
    Log    Done.

Insert The Sales Data For The Week And Export It As PDF
    Open The Intranet Website
    Log In


*** Keywords ***
Open The Intranet Website
    Log    open website
    Open Available Browser    https://robotsparebinindustries.com/

Open Browser And Go To KW
    # open available browser    https://przegladarka-ekw.ms.gov.pl/eukw_prz/KsiegiWieczyste/wyszukiwanieKW?komunikaty=true&kontakt=true&okienkoSerwisowe=false
    Open Available Browser    https://ekw.ms.gov.pl/eukw_ogol/menu.do
    click element    Przeglądanie Księgi Wieczystej

Log In
    Input Text    username    maria
    Input Text    password    thoushallnotpass
    Submit Form

