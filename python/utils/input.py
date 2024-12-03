import sys


def read_day(num: int | None = None, mod: str | None = None) -> str:
    pathday = sys.argv[0].split("/")[1].split(".")[0] if num is None else num
    pathmod = (sys.argv[1] if len(sys.argv) > 1 else "") if mod is None else mod
    path = f"input/{pathday}{pathmod}.in"
    with open(path, "r") as f:
        text = f.read()
    return text
