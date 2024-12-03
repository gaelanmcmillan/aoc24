#! /bin/zsh

DAY=$1
COOKIE=$(cat cookie)

if (( $DAY < 1 || $DAY > 25 )); then
    echo "error: invalid day '$DAY'"
fi

if [ ! -f input/$DAY.in ]; then
    echo "getting day $DAY"
    > input/$DAY.in curl -o - "https://adventofcode.com/2024/day/$DAY/input" -H "cookie: $COOKIE"
else
    echo "already got day $DAY!"
fi