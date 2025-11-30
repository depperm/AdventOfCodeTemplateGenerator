import os
import sys

if __name__ == "__main__":
    if len(sys.argv[1:]) != 1:
        exit(f"Need to define a single language template ({sys.argv[1:]})")
    langToTemplate = sys.argv[1:][0]

    if os.path.isdir(os.path.join(os.getcwd(), "templates", langToTemplate)):
        exit(
            f"There is already a template for {langToTemplate}. If you are sure, please delete the existing directory."
        )

    os.mkdir(os.path.join(os.getcwd(), "templates", langToTemplate))
    README_CONTENT = """# {} Language
[Documentation](TODO UPDATE LINK)

## How to run
``
""".format(langToTemplate)

    SAMPLE_CONTENT = """one 3 2
two 2 3
three 2 3"""

    with open(
        os.path.join(os.getcwd(), "templates", langToTemplate, "README.md"),
        "w",
        encoding="utf-8",
    ) as file:
        file.write(README_CONTENT)

    with open(
        os.path.join(os.getcwd(), "templates", langToTemplate, "sample.txt"),
        "w",
        encoding="utf-8",
    ) as file:
        file.write(SAMPLE_CONTENT)
