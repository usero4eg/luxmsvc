#!/bin/sh

#Total string count:
# 1st column string count, second - filename
#str == wc -l filename.log | awk '{print $1 }'

# --------------------------------------------
# Remove [] brackets and set Tab in Date ($4) column
# output result to STDOUT
awk '{sub (/][:punct:]_[:blank]]/," ", $4); print $0}' filename.log

# -------------------------------------------
# Remove column separator & from the string
# and set it like a Tab
# all result move to STATIC_URL.log
awk '{gsub(/&/," ", ); print $0}' filename.log

# -------------------------------------------
# Time in sec's between e=INIT and near next e=STARTED state or e=FAILED state
awk 'e=INIT/{flag=1; print $0; next}/e=STARTED|e=FAILED/{flag=0; print $0} flag'
   
