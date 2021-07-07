USER=user_account
PSW=user_password
HOST=db_url
PORT=3306
SCH=old_schema_name
NEW_SCH=new_schema_name
# mysql -u$USER -p$PSW -e 'create database if not exists $NEW_SCH'
 
list_table=$(mysql -u$USER -p$PSW -h $HOST --port $PORT -Nse "select table_name from information_schema.TABLES where TABLE_SCHEMA='$SCH'")
 
for table in $list_table
do
    mysql -u$USER -p$PSW -h $HOST --port $PORT -e "rename table $SCH.$table to $NEW_SCH.$table"
    echo "rename table $SCH.$table to $NEW_SCH.$table success"
done
    echo "done"
