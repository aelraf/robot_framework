 *** Settings ***
Documentation    Demonstrate log levels.

*** Test Cases ***
Multi Log Level Test Case    
    [Documentation]    Log message on each log level.
    Log    Warning message    WARN
    Log    Info message    
    Log    Second info message    INFO
    Log    Debug message    DEBUG
    Log    Trace message    TRACE


