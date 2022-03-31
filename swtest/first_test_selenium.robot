*** Settings ***
Library    Selenium2Library


*** Variables ***
${USERNAME}    swtestacademy@gmail.com
${PASSWORD}    wrongpass
${BROWSER}    Chrome
${SiteUrl}    http://www.kariyer.net/
${DashboardTitle}  Title Title Title
${ExpectedWarningMessage}   Wrong password!
${WarningMessage}    Login Failed!
${Delay}    5s


*** Keywords ***
Open Chrome With Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    start-maximized
    Call Method    ${options}    add_argument    disable-extensions
    Create WebDriver    Chrome    chrome_options=${options}

Open Kariyernet
    Open Browser    url=${SiteUrl}    browser=${BROWSER}

Check Title
    Title Should Be    ${DashboardTitle}

Maximize Browser
    Maximize Browser Window

Go To User Login Page
    # Execute Javascript    document.getElementsByClassName('login-control')[0].style.display='block'
    Click Link    xpath=//a[@href="http://www.kariyerim/login.aspx"]

Enter User Name
    Input Text    id=lgnUserName    ${Username}

Enter Wrong Password
    Input Text    id=lgnPassword    ${Password}

Click Login
    Click Link    xpath=//a[@href="javascript:__doPostBack('ctl00$MasterPageBody$LinkButton1','')"]

Assert Warning Message
    Element Text Should Be    css=.error    ${ExpectedWarningMessage}    ${WarningMessage}
