#!/usr/bin/env bash
set -eu

save_dir="data"
count=23
for (( i = 3; i <= $count; i++ )); do
    printf -v fname "round%02d.json" "$i"
    save_file="$save_dir/$fname"

    if [[ ! -f $save_file ]]; then
        echo download $save_file
        curl -o $save_file "https://www.techempower.com/benchmarks/results/round$i/ph.json"
        sleep 2
    fi
done
