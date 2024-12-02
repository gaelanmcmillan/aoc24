#! /bin/zsh

DAY=$1
COOKIE=$(cat cookie)

if (( $DAY < 1 || $DAY > 25 )); then
    echo "error: invalid day '$DAY'"
fi

if [ ! -f input/$DAY.in ]; then
    echo "getting day $DAY"

    > input/$DAY.in curl -o - "https://adventofcode.com/2024/day/$DAY/input" \
        -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
        -H 'accept-language: en-US,en;q=0.9' \
        -H 'cache-control: max-age=0' \
        -H "cookie: $COOKIE" \
        -H 'priority: u=0, i' \
        -H 'referer: https://adventofcode.com/2024/day/1' \
        -H 'sec-ch-ua: "Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"' \
        -H 'sec-ch-ua-mobile: ?0' \
        -H 'sec-ch-ua-platform: "macOS"' \
        -H 'sec-fetch-dest: document' \
        -H 'sec-fetch-mode: navigate' \
        -H 'sec-fetch-site: same-origin' \
        -H 'sec-fetch-user: ?1' \
        -H 'upgrade-insecure-requests: 1' \
        -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'
else
    echo "already got day $DAY!"
fi