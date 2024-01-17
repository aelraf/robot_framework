# na podstawie kursu ze strony:
# https://realpython.com/python-generate-qr-code/
#
# ciekawa biblioteka: https://pypi.org/project/qrcode/

import segno


def generate_qr_with_word(word):
    qrcode = segno.make_qr(word)
    qrcode.save(word + ".png")


if __name__ == "__main__":
    generate_qr_with_word("Hello, World!")
