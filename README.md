Description
===========

Sample Heat template that creates stack tiers, injects a simple
BASH script through cloud-init that installs Chef-client and
joins a Chef Server.


Requirements
============
* A Heat provider that supports the following:
  * OS::Heat::ResourceGroup
  * OS::Nova::KeyPair
  * Rackspace::Cloud::LoadBalancer
* An OpenStack username, password, and tenant id.
* [python-heatclient](https://github.com/openstack/python-heatclient)
`>= v0.2.8`:

```bash
pip install python-heatclient
```

We recommend installing the client within a [Python virtual
environment](http://www.virtualenv.org/).

Parameters
==========
Parameters can be replaced with your own values when standing up a stack. Use
the `-P` flag to specify a custom parameter.

* `t2_image`: Optional: Server image used for the server created
as a part of this deployment.
 (Default: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM))
* `chef_version`: Optional: Version of Chef Client to use
 (Default: 11.16.0)
* `t2_flavor`: Optional: Rackspace Cloud Server flavor to use. The size is based on the
amount of RAM for the provisioned server.
 (Default: 1 GB Performance)
* `validation_key`: Required: chef-client will attempt to use the private key assigned to the
chef-validator, located in /etc/chef/validation.pem. If, for any reason,
the chef-validator is unable to make an authenticated request to the
Chef server, the initial chef-client run will fail.
 (Default: None)
* `chef_server_url`: Optional: Chef Server URL. Defaults to None, but the BASH script will
infer the Managed Chef URL from the organization
 (Default: '')
* `t2_name`: Base name for Teir 1 (Default: tier2)
* `organization`: Required: Chef organization
 (Default: None)
* `t2_count`: Number of Tier 2 nodes to create. (Default: 1)
* `child_template`: (Default: https://raw.github.com/AutomationSupport/heat-stack/master/stack_single.yml)
* `t2_role`: Optional: Chef Role. Will default to "_default"
 (Default: _default)
* `t1_load_balancer`: Load Balancer that points to nodes in Tier 2. (Default: Tier1LB)

Outputs
=======
Once a stack comes online, use `heat output-list` to see all available outputs.
Use `heat output-show <OUTPUT NAME>` to get the value of a specific output.

* `private_key`: SSH Private Key 
* `t2_server_ip`: Tier 2 Server IP 
* `t1_loadbalancer`: Tier 1 Load Balancer IP 

For multi-line values, the response will come in an escaped form. To get rid of
the escapes, use `echo -e '<STRING>' > file.txt`. For vim users, a substitution
can be done within a file using `%s/\\n/\r/g`.
