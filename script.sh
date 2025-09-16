#!/bin/bash

# Run inside your main repo (test-repo)
# Do NOT create a nested repo

# Generate commits from Sept 2019 to Sept 2024
start_year=2019
end_year=2024

for year in $(seq $start_year $end_year); do
  for month in 01 04 07 10; do   # quarterly commits
    for day in 05 15 25; do      # 3 commits each quarter
      file="file_${year}_${month}_${day}.txt"
      echo "Work done on $year-$month-$day" > $file
      git add $file
      GIT_AUTHOR_DATE="$year-$month-$day 12:00:00" \
      GIT_COMMITTER_DATE="$year-$month-$day 12:00:00" \
      git commit -m "Commit from $year-$month-$day"
    done
  done
done
