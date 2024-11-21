START_DATE="2021-01-30"
END_DATE="2024-11-20"

REPO_PATH="C:\Users\Asus\Documents\BRAND"

cd$REPO_PATH || exit

CURRENT_DATE=$START_DATE
while [ "$CURRENT_DATE" != "$(date -I -d "$END_DATE + 1 day")" ]; do
MAKE_COMMITS=$(shuf -i 1-1 -n 1)

if [ "$MAKE_COMMITS" -eq 1 ]; then
NUM_COMMITS=$(shuf -i 1-15 -n 1)

for ((i = 1; i <= NUM_COMMITS; i++)); do
      echo "Commit on $CURRENT_DATE: $i"
      GIT_AUTHOR_DATE="$CURRENT_DATE 12:00:00" GIT_COMMITTER_DATE="$CURRENT_DATE 12:00:00" \
        git commit --allow-empty --date="$CURRENT_DATE 12:00:00" -m "Commit #$i for $CURRENT_DATE: Brand contents"
    done
  fi

  SKIP_DAYS=$(shuf -i 1-2 -n 1)
  CURRENT_DATE=$(date -I -d "$CURRENT_DATE + $SKIP_DAYS days")
done