# przykład tworzenia i modyfikowania zmiennych w teście lub Keywordzie
# za pomocą odpowiednich keywordów
*** Test Cases ***
Variable In Keyword
    ${new_name}=    Set Variable    Janusz
    ${new_list}=    Create List    Janusz    Alicja    Natalia
    ${new_dict}=    Create Dictionary    name=Anna    lastname=Nowak

    Length Should Be    ${new_list}    3

    Log    Variable new_name: ${new_name}
    Log    Variable new_list: ${new_list}
    Log    Variable new_dict: ${new_dict}
