# na podstawie kursu ze strony:
# https://realpython.com/python-generate-qr-code/
# https://realpython.com/read-write-files-python/
#
# ciekawa biblioteka: https://pypi.org/project/qrcode/

import segno


def generate_qr_with_word(word, licznik):
    qrcode = segno.make_qr(word)
    qrcode.save(
        str(licznik) + ".png",
        scale=5,
        border=3,
    )


def read_from_file_and_return_list(file):
    all_data = []

    try:
        file = open(file, 'r')
        try:
            line = file.readline()
            while line != '':           # EOF to pusty string
                all_data.append(line)
                line = file.readline()
        except Exception:
            print("-- -- Exception")
        finally:
            file.close()
    except FileNotFoundError:
        print("-- -- File not found")

    return all_data


if __name__ == "__main__":
    lista = read_from_file_and_return_list("linki.txt")
    i = 0
    for item in lista:
        i += 1
        # print(item)
        generate_qr_with_word(item, i)
