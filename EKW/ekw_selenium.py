# -*- coding: utf-8 -*-
# na podstawie:
# https://www.zenrows.com/blog/scraping-javascript-rendered-web-pages#installing-the-requirements

import time

import pandas as pd
from selenium import webdriver
from selenium.webdriver import Chrome
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager


def initialization_of_connection():
    options = webdriver.ChromeOptions()
    # options.headless = True
    options.headless = False
    options.page_load_strategy = "none"
    chrome_path = ChromeDriverManager().install()
    chrome_service = Service(chrome_path)
    driver = Chrome(options=options, service=chrome_service)
    driver.implicitly_wait(5)

    url = "https://przegladarka-ekw.ms.gov.pl/eukw_prz/KsiegiWieczyste/wyszukiwanieKW"

    driver.get(url)
    time.sleep(10)

    content = driver.find_element(By.CSS_SELECTOR, "div[input id*='kodWydzialu'")

    breads = content.find_elements(By.TAG_NAME, "li")

    return breads


def parse_img_url(url):
    url = url.split(', ')[0]
    splitted_url = url.split('/')
    for idx, part in enumerate(splitted_url):
        if 'cloudfront' in part:
            return 'https://' + '/'.join(splitted_url[idx:])


def extract_data(element):
    img = element.find_element(By.TAG_NAME, "img").get_attribute("srcset")
    img = parse_img_url(img)

    dietary_attrs = element.find_elements(By.CSS_SELECTOR, "div[class*='Dietery']>span")
    if dietary_attrs:
        dietary_attrs = [attr.text for attr in dietary_attrs]
    else:
        dietary_attrs = None

    price = element.find_elements(By.CSS_SELECTOR, "div[class*='ItemBCard']>span")
    if price:
        price = price[0].text
    else:
        price = None


if __name__ == "__main__":
    elem = initialization_of_connection()

    extract_data(elem)

