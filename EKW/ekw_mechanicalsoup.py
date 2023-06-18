import re
import mechanicalsoup
import html
import urllib.parse


def count_a_control_digit(number):
    """
    :param number: liczba, której chcemy przyporządkować cyfrę kontrolną
    :return: cyfra kontrolna, zgodna z algorytmem dla EKW
    """
    rest = []
    for i in range(8):
        rest.append(number % 10)
        number = int(number / 10)

    digit = 7 * rest[0] + 3 * rest[1] + 1 * rest[2] + 7 * rest[3] \
            + 3 * rest[4] + 1 * rest[5] + 7 * rest[6] + 3 * rest[7]

    return digit % 10


def save_to_file(data):
    """
    zapisuje dane podane jako parametr wywołania do pliku
    :param data - dane do zapisania do pliku
    :return: zapisane dane w pliku
    """
    file = open('numery_KW.txt', 'a+')
    file.write(data)
    file.close()


def automate_search_in_ekw(number: int, digit: int):
    """
    na podstawie kodu z https://pypi.org/project/MechanicalSoup/
    :return:
    """
    browser = mechanicalsoup.StatefulBrowser(user_agent='User')
    browser.open("https://przegladarka-ekw.ms.gov.pl/eukw_prz/KsiegiWieczyste/wyszukiwanieKW")

    browser.select_form(selector='form')
    browser['kryteriaWKW'] = {
        'kodWydzialuInput': "TO1T",
        'numerKsiegiWieczystej': number,
        'cyfraKontrolna': digit
    }

    browser.submit_selected()

    for link in browser.page.select('.result a'):
        href = link.attrs['href']
        m = re.match(r"^/adres/[^/]*(.*)$", href)
        if m:
            href = urllib.parse.unquote(m.group(1))
        print(link.text, '->', href)


if __name__ == "__main__":
    automate_search_in_ekw(1, 7)

    # save_to_file('podejrzane KW giszczak\n')
    # for i in range(100000):
    #     cyfra = count_a_control_digit(i)
    #     if i % 10 == 9 and cyfra == 6:
    #         automate_search_in_ekw(i, cyfra)
    #         # data = str(i) + " " + str(cyfra) + "\n"
    #         # save_to_file(data=data)
