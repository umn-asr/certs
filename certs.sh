#!/bin/bash

domains=(
academic-calendar-staging.umn.edu
academic-calendar.umn.edu
apps.asr.umn.edu
apps-test.asr.umn.edu
assets-staging.asr.umn.edu
assets.asr.umn.edu
course-fees-staging.umn.edu
course-fees.umn.edu
courses-staging.umn.edu
courses.umn.edu
faculty-roles-staging.umn.edu
faculty-roles.umn.edu
forseti-staging.umn.edu
forseti.umn.edu
gpacalc-staging.umn.edu
gpacalc.umn.edu
onestop-queue-staging.umn.edu
onestop-queue.umn.edu
our-stg.umn.edu
our.umn.edu
roomsearch-staging.umn.edu
roomsearch.umn.edu
scholarships-staging.umn.edu
scholarships.umn.edu
sdp-messages-staging.umn.edu
sdp-messages.umn.edu
sdp-staging.umn.edu
sdp.umn.edu
sessions-staging.umn.edu
sessions.umn.edu
student-athletes-stage.umn.edu
student-athletes.umn.edu
terms-staging.umn.edu
terms.umn.edu
tfms-staging.umn.edu
tfms.umn.edu
wfg-dirsync-staging.asr.umn.edu
wfg-dirsync.asr.umn.edu
)

thirty_days=$(date -j -v +30d +"%Y%m%d")

echo "Starting check for certs expiring before $thirty_days"

for d in "${domains[@]}"; do

  date_string=$(echo | openssl s_client -servername "$d" -connect "$d":443 2>/dev/null | openssl x509 -noout -dates | grep "notAfter" | cut -d= -f2)
  not_after_date=$(date -j -f "%b %d %T %Y %Z" "$date_string" +"%Y%m%d")

  if [ $thirty_days -gt $not_after_date ]; then
    echo "$d"
    echo "$date_string"
    echo "EXPIRING BEFORE $thirty_days"
    printf "\n"
  fi
done
