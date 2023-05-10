import pytest

from ekw import count_a_control_digit


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
