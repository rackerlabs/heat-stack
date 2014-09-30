from fabric.api import env, run, task
from envassert import detect, file, group, package, port, process, service, user

@task
def check():
    env.platform_family = detect.detect()

    assert file.exists("/etc/chef/validator.pem"), "/etc/chef/validator.pem is missing."
    assert file.exists("/etc/chef/client.rb"), "/etc/chef/client.rb is missing."
    assert file.exists("/etc/chef/first-boot.json"), "/etc/chef/first-boot.json is missing."
    assert file.exists("/usr/bin/chef-client"), "/usr/bin/chef-client is missing."
    assert process.is_up("chef-client"), "chef-client is not running."
