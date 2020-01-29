# ./get_scn sid rcat

# set parameter
export NLS_DATE_FORMAT='MM-DD-YYYY HH24:MI:SS'
TYPE=SBT_TAPE

echo "Enter Date for point in time in MM-DD-YYYY: "
read date_in

# Connect to remote target and rcat to get SCN
rman target sys/xxxxxxxx@{1} catalog rcat/xxxxxxxx@${2} log=${1}_scn.log << eof1
list backup of archivelog all;
eof1

# Magic
sed -i '/${TYPE}/d' ${1}_scn.log
echo
grep ${date_in} ${1}_scn.log | sort | awk 'BEGIN {print( "logseq\tSCN\tDate\ttime")} {print $2,$6,$7,$8}'
