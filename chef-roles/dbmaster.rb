name "dbmaster"
description "A role to configure our master database server"
run_list "recipe[phpstack::mysql_master]", "recipe[phpstack::mysql_holland]"
default_attributes ['phpstack']['demo']['enabled']=true
