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

* `t3_name`: Base name for Tier 3 (Default: tier3)
* `t2_image`: Optional: Server image used for the server created
as a part of this deployment.
 (Default: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM))
* `t4_image`: Optional: Server image used for the server created
as a part of this deployment.
 (Default: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM))
* `t3_flavor`: Optional: Rackspace Cloud Server flavor to use. The size is based on the
amount of RAM for the provisioned server.
 (Default: 1 GB Performance)
* `child_template`: (Default: https://raw.githubusercontent.com/rackops/heat-stack/master/stack_single.yaml)
* `chef_server_url`: Optional: Chef Server URL. Defaults to None, but the BASH script will
infer the Managed Chef URL from the organization
 (Default: '')
* `t4_count`: Number of Tier 4 nodes to create. (Default: 1)
* `t4_name`: Base name for Tier 4 (Default: tier4)
* `t2_count`: Number of Tier 2 nodes to create. (Default: 1)
* `t3_count`: Number of Tier 3 nodes to create. (Default: 1)
* `chef_env`: Required: Chef Environment
 (Default: _default)
* `t4_role`: Optional: Chef Role. Will default to "_default"
 (Default: dbslave)
* `t2_flavor`: Optional: Rackspace Cloud Server flavor to use. The size is based on the
amount of RAM for the provisioned server.
 (Default: 1 GB Performance)
* `t3_role`: Optional: Chef Role. Will default to "_default"
 (Default: dbmaster)
* `validation_key`: Required: chef-client will attempt to use the private key assigned to the
chef-validator, located in /etc/chef/validation.pem. If, for any reason,
the chef-validator is unable to make an authenticated request to the
Chef server, the initial chef-client run will fail. Must be base64 encoded.
 (Default: None)
* `t3_image`: Optional: Server image used for the server created
as a part of this deployment.
 (Default: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM))
* `t2_name`: Base name for Tier 2 (Default: tier2)
* `organization`: Required: Chef organization
 (Default: '')
* `t4_flavor`: Optional: Rackspace Cloud Server flavor to use. The size is based on the
amount of RAM for the provisioned server.
 (Default: 1 GB Performance)
* `chef_version`: Optional: Version of Chef Client to use
 (Default: 11.16.0)
* `t2_role`: Optional: Chef Role. Will default to "_default"
 (Default: webserver)
* `t1_load_balancer`: Load Balancer that points to nodes in Tier 2. (Default: tier1LB)

Outputs
=======
Once a stack comes online, use `heat output-list` to see all available outputs.
Use `heat output-show <OUTPUT NAME>` to get the value of a specific output.

* `private_key`: SSH Private Key 
* `t1_loadbalancer`: Tier 1 Load Balancer IP 
* `t3_public_ip`: Tier 3 Public IP 
* `t3_private_ip`: Tier 3 Private IP 
* `t2_public_ip`: Tier 2 Public IP 
* `t2_private_ip`: Tier 2 Private IP 
* `t4_public_ip`: Tier 4 Public IP 
* `t4_private_ip`: Tier 4 Private IP 

For multi-line values, the response will come in an escaped form. To get rid of
the escapes, use `echo -e '<STRING>' > file.txt`. For vim users, a substitution
can be done within a file using `%s/\\n/\r/g`.
