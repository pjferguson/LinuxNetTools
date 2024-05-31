#! /bin/bash

function sys_process() 
{
vmstat 1 > system-stats.txt &
sleep 60
job_id=$!
jobs
kill $job_id
tail -n 5 system-stats.txt
wc -l system-stats.txt
}


sys_process



