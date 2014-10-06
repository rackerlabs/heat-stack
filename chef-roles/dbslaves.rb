name "dbslaves"
description "A role to configure our slave database servers"
run_list "recipe[phpstack::mysql_slave]"
default_attributes ['phpstack']['demo']['enabled']=true
