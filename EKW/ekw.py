# -*- coding: utf-8 -*-

import requests
import json


def count_a_control_digit(number):
    """
    :param number: liczba, której chcemy przyporządkować cyfrę kontrolną
    :return: cyfra kontrolna, zgodna z algorytmem dla EKW
    """
    rest = []
    for i in range(8):
        rest.append(number % 10)
        number = int(number / 10)
#    print(rest)

    digit = 7 * rest[0] + 3 * rest[1] + 1 * rest[2] + 7 * rest[3] \
            + 3 * rest[4] + 1 * rest[5] + 7 * rest[6] + 3 * rest[7]

    # print(digit % 10)

    return digit % 10


def get_from_rest():
    """
    wysyła polecenie GET do elektronicznych ksiąg wieczystych - czyli po prostu łączy się z tym adresem url
    zwraca kod odpowiedzi (200 - ok)
    """
    api_url = "https://przegladarka-ekw.ms.gov.pl/eukw_prz/KsiegiWieczyste/wyszukiwanieKW"
    response = requests.get(api_url)
    return response


def read_from_rest_with_header(number, digit, key=None):
    """
    Wysyła zapytanie do EKW z nagłówkiem (wziętym z zapytania przeglądarkowego)
    :param number: numer księgi wieczystej
    :param digit: cyfra kontrolna
    :param key: klucz do sesji z serwerem
    :return: zwraca odpowiedź od serwera EKW
    """
    api_url = "https://przegladarka-ekw.ms.gov.pl/eukw_prz/KsiegiWieczyste/wyszukiwanieKW"
    data_for_book = {
        "kodEci": "TO1T",
        "numerKw": number,
        "cyfraKontrolna": digit,
        "wyszukaj": "Submit"
    }
    headers = {
        {
            "name": "Accept",
            "value": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8"
        },
        {
            "name": "Accept-Encoding",
            "value": "gzip, deflate, br"
        },
        {
            "name": "Accept-Language",
            "value": "pl,en-US;q=0.7,en;q=0.3"
        },
        {
            "name": "Connection",
            "value": "keep-alive"
        },
        {
            "name": "Content-Length",
            "value": "61"
        },
        {
            "name": "Content-Type",
            "value": "application/x-www-form-urlencoded"
        },
    }

    response = requests.post(api_url, data=json.dumps(data_for_book), headers=headers)
    print('response.request:')
    print(response.content)

    return response


def read_from_rest(number, digit):
    """
    Wysyła zapytanie POST bez dodatkowego nagłówka
    :param number: numer KW
    :param digit: cyfra kontrolna do danego numeru KW

    :return: zwraca odpowiedź od serwera EKW
    """
    api_url = "https://przegladarka-ekw.ms.gov.pl/eukw_prz/KsiegiWieczyste/wyszukiwanieKW"
    data_for_book = {
        "kodEci": "TO1T",
        "numerKw": number,
        "cyfraKontrolna": digit,
        "wyszukaj": "Submit"
    }
    response = requests.post(api_url, data=json.dumps(data_for_book))

    return response


def save_to_file(data):
    """
    zapisuje dane podane jako parametr wywołania do pliku
    :param data - dane do zapisania do pliku
    :return: zapisane dane w pliku
    """
    file = open('numery_KW.txt', 'a+')
    file.write(data)
    file.close()


def analise_of_response(response):
    """
    zwraca nam 20 znaków z argumentu wywołania po wzorniku,
    :param response: przyjmuje dane tekstowe, szukamy w nich wzornika <label> Położenie </label>
    :return: 20 znaków (adres powiązany z daną KW)
    """
    data = []
    return data


if __name__ == "__main__":
    # resp = read_from_rest(1, 7)
    # print("status code: ", resp.status_code)
    # print("data:")
    # print(resp)
    # print(resp.request)

    resp = read_from_rest_with_header(1, 7)
    print("status code: ", resp.status_code)
    print("data:")
    print(resp)

    # dziala
    # save_to_file('podejrzane o KW giszczak\n')
    # for i in range(100000):
    #     cyfra = count_a_control_digit(i)
    #     if i % 10 == 9 and cyfra == 6:
    #         data = str(i) + " " + str(cyfra) + "\n"
    #         save_to_file(data=data)
    pass
