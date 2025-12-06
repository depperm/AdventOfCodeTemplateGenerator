from __future__ import annotations

import os
import random
import shutil
import sys
from datetime import datetime
from pathlib import Path

AVAILABLE_LANGS = os.listdir(os.path.join(os.getcwd(), "templates"))


def exit(err: str):
    print(err)
    sys.exit(1)


def argparse():
    year = datetime.now().year
    day = datetime.now().day
    lang = "python"
    if len(sys.argv[1:]) % 2 != 0:
        exit("You don't have enough arguments")
    i = 0
    while i < len(sys.argv[1:]):
        if sys.argv[1:][i] not in ["-d", "-y", "-l"]:
            exit(f"Unrecognized option ({sys.argv[1:][i]})")
        if sys.argv[1:][i] == "-d":
            try:
                day = int(sys.argv[1:][i + 1])
            except ValueError:
                if sys.argv[1:][i + 1] == "all":
                    day = "all"
                else:
                    exit("Day must be a number or all")
            if day != "all":
                if day < 1:
                    exit("Day must be at least 1")
                if day > 25:
                    exit("Day must be less than 26")
        elif sys.argv[1:][i] == "-l":
            lang = sys.argv[1:][i + 1]
            if lang not in AVAILABLE_LANGS and lang != "alpha":
                exit(f"Language ({lang}) unrecognized")
        elif sys.argv[1:][i] == "-y":
            try:
                year = int(sys.argv[1:][i + 1])
            except ValueError:
                exit("Year must be a number")
            if year < 2015:
                exit("Year has to be at least 2015")
            if year > datetime.now().year:
                exit("Year has to be before current year")
        i += 2

    return lang, day, year


if __name__ == "__main__":
    lang, day, year = argparse()

    # create year dir if does not exist
    if not os.path.isdir(os.path.join(os.getcwd(), "advent", str(year))):
        os.mkdir(os.path.join(os.getcwd(), "advent", str(year)))

    if lang == "alpha":
        langs = AVAILABLE_LANGS
        while len(langs) < 25:
            langs += AVAILABLE_LANGS
        while len(langs) > 25:
            _ = langs.pop(random.randint(0, len(langs) - 1))
        # print(f"alpha {langs}")
        for i, lang in enumerate(langs):
            # create day dir if does not exist
            if not os.path.isdir(
                os.path.join(os.getcwd(), "advent", str(year), str(i + 1))
            ):
                os.mkdir(os.path.join(os.getcwd(), "advent", str(year), str(i + 1)))
            from_directory = os.path.join(os.getcwd(), "templates", lang)
            to_directory = os.path.join(os.getcwd(), "advent", str(year), str(i + 1))

            try:
                _ = shutil.copytree(from_directory, to_directory, dirs_exist_ok=True)
            except Exception as e:
                exit(f"An error occurred: {e}")
    else:
        if day == "all":
            for d in range(1, 25):
                # create day dir if does not exist
                if not os.path.isdir(
                    os.path.join(os.getcwd(), "advent", str(year), str(d))
                ):
                    os.mkdir(os.path.join(os.getcwd(), "advent", str(year), str(d)))
                # fill in lang appropriate content
                from_directory = os.path.join(os.getcwd(), "templates", lang)
                to_directory = os.path.join(os.getcwd(), "advent", str(year), str(d))

                try:
                    _ = shutil.copytree(
                        from_directory, to_directory, dirs_exist_ok=True
                    )
                except Exception as e:
                    exit(f"An error occurred: {e}")
                # make empty input
                _ = Path(os.path.join(to_directory, "puzzleInput.txt")).touch()
        else:
            # create day dir if does not exist
            if not os.path.isdir(
                os.path.join(os.getcwd(), "advent", str(year), str(day))
            ):
                os.mkdir(os.path.join(os.getcwd(), "advent", str(year), str(day)))
            # fill in lang appropriate content
            from_directory = os.path.join(os.getcwd(), "templates", lang)
            to_directory = os.path.join(os.getcwd(), "advent", str(year), str(day))

            try:
                _ = shutil.copytree(from_directory, to_directory, dirs_exist_ok=True)
            except Exception as e:
                exit(f"An error occurred: {e}")
            # make empty input
            _ = Path(os.path.join(to_directory, "puzzleInput.txt")).touch()
