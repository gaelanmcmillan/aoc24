from utils.input import read_day

text = read_day()

lines = text.split("\n")
rows = [list(map(int, l.strip().split())) for l in lines if l.strip()]


def valid(row):
    adj = [a - b for a, b in zip(row, row[1:])]
    return all(1 <= abs(a) <= 3 and (a > 0) == (adj[0] > 0) for a in adj)


def valid_after_removal(row):
    return any(valid(row[:i] + row[i + 1 :]) for i in range(len(row)))


p1 = len(list(r for r in rows if valid(r)))
p2 = len(list(r for r in rows if valid(r) or valid_after_removal(r)))

print(f"{p1=} {p2=}")
