from fabric.api import env, run, task
from envassert import detect, file, group, package, port, process, service, user

@task
def check():
    env.platform_family = detect.detect()

    assert file.exists("/etc/chef/validator.pem")
    assert file.exists("/etc/chef/client.rb")
    assert file.exists("/etc/chef/first-boot.json")
    assert file.exists("/usr/bin/chef-client")
    assert process.is_up("chef-client")
