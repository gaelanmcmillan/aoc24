from utils.input import read_day
import re

text = read_day()


def parse(mul) -> tuple[int, int]:
    L, R = mul.split(",")
    _, n = L.split("(")
    m, _ = R.split(")")
    return int(n), int(m)


pat = re.compile(r"(mul\(\d+\,\d+\)|don\'t\(\)|do\(\))")
matches = [str(m) for m in re.findall(pat, text)]


pairs = [parse(s) for s in matches if s.startswith("mul")]
p1 = sum(n * m for n, m in pairs)

do_mul = True
p2 = 0
for m in matches:
    if m.startswith("mul") and do_mul:
        x, y = parse(m)
        p2 += x * y
    if m.endswith("t()"):
        do_mul = False
    if m.endswith("do()"):
        do_mul = True

print(f"{p1=}, {p2=}")
