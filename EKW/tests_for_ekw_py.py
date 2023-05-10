import pytest

from ekw import *


class TestClassEkw:
    def test_count_a_control_digit_good(self):
        number = 123
        wynik = count_a_control_digit(number)

        assert wynik == 8

    def test_count_a_control_digit_bad(self):
        number = 123
        wynik = count_a_control_digit(number)

        assert wynik != 12

    def test_count_a_control_digit_big_number(self):
        number = 12345678
        wynik = count_a_control_digit(number)

        assert wynik == 0

    def test_rest_code(self):
        number = 1
        digit = 7

        wynik = read_from_rest_with_header(number, digit)

        assert wynik.status_code == 200

    def test_rest_data(self):
        number = 1
        digit = 7

        wynik = read_from_rest_with_header(number, digit)

        assert wynik.raw == 2

