#!/bin/bash
sum=0
echo -n "Մուտքագրեք թվեր (ավարտելու համար մուտքագրեք 'done'): "
while read num; do
    if [[ $num == "done" ]]; then
        break
    fi
    sum=$((sum + num))
done
echo "Գումարը՝ $sum"
