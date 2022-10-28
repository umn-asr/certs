#!/bin/bash

domains=(
academic-calendar-staging.umn.edu
academic-calendar.umn.edu
assets-staging.asr.umn.edu
assets.asr.umn.edu
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

for d in ${domains[@]}; do
  echo $d
  echo | openssl s_client -servername $d -connect $d:443 2>/dev/null | openssl x509 -noout -dates
  printf "\n"
done
