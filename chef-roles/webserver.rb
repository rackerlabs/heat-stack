name "webserver"
description "A role to configure our front-line web servers"
run_list "recipe[phpstack::application_php]"
default_attributes ['phpstack']['demo']['enabled']=true
