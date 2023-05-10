#

import requests
import json


def count_a_control_digit(number):
    digit = 0
    return digit


def get_from_rest():
    """
    wysyła polecenie GET do elektronicznych ksiąg wieczystych - czyli po prostu łączy się z tym adresem url
    zwraca kod odpowiedzi (200 - ok)
    """
    api_url = "https://przegladarka-ekw.ms.gov.pl/eukw_prz/KsiegiWieczyste/wyszukiwanieKW"
    response = requests.get(api_url)
    return response


def get_from_rest_with_data(number, digit):
    """
    :param number: numer księgi wieczystej
    :param digit: cyfra kontrolna
    :return:
    """
    api_url = "https://przegladarka-ekw.ms.gov.pl/eukw_prz/KsiegiWieczyste/wyszukiwanieKW"
    data_for_book = {
        "kodEci": "TO1T",
        "numerKw": number,
        "cyfraKontrolna": digit,
        "wyszukaj": "Submit"
    }
    response = requests.get(api_url, data_for_book)
    return response


def read_from_rest_with_header(number, digit):
    api_url = "https://przegladarka-ekw.ms.gov.pl/eukw_prz/KsiegiWieczyste/wyszukiwanieKW"
    data_for_book = {
        "kodEci": "TO1T",
        "numerKw": number,
        "cyfraKontrolna": digit,
        "wyszukaj": "Submit"
    }
    headers = {"Content-Type": "application/x-www-form-urlencoded"}

    response = requests.post(api_url, data=json.dumps(data_for_book), headers=headers)

    return response


def read_from_rest(number, digit):
    api_url = "https://przegladarka-ekw.ms.gov.pl/eukw_prz/KsiegiWieczyste/wyszukiwanieKW"
    data_for_book = {
        "kodEci": "TO1T",
        "numerKw": number,
        "cyfraKontrolna": digit,
        "wyszukaj": "Submit"
    }
    response = requests.post(api_url, data=json.dumps(data_for_book))

    return response


def analise_of_response(response):
    data = []
    return data


if __name__ == "__main__":
    resp = read_from_rest(1, 7)
    print("status code: ", resp.status_code)
    print("data:")
    print(resp)
    print(resp.request)

    # poniższe zwraca komunikat:
    # requests.exceptions.ConnectionError: ('Connection aborted.', ConnectionResetError(10054, 'Istniejące połączenie zostało gwałtownie zamknięte przez zdalnego hosta', None, 10054, None))
    # resp2 = get_from_rest_with_data(1, 7)
    # print("status code: ", resp2.status_code)
    # print("data:")
    # print(resp2)

