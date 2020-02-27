set linesize 999 pagesize 999

column action format a8
column ACTION_TIME format a30
column status format a8
column description format a56

select patch_id, action, ACTION_TIME, status, description from sys.registry$sqlpatch;
