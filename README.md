[![Circle CI](https://circleci.com/gh/rackops/heat-stack.png?style=badge)](https://circleci.com/gh/rackops/heat-stack)

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

* `t6_image`: Optional: Server image used for the server created
as a part of this deployment.
 (Default: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM))
* `t2_image`: Optional: Server image used for the server created
as a part of this deployment.
 (Default: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM))
* `t9_flavor`: Optional: Rackspace Cloud Server flavor to use. The size is based on the
amount of RAM for the provisioned server.
 (Default: 1 GB Performance)
* `t8_role`: Optional: Chef Role. Will default to "_default"
 (Default: _default)
* `t4_count`: Number of Tier 4 nodes to create. (Default: 1)
* `t4_name`: Base name for Tier 4 (Default: tier4)
* `t9_name`: Base name for Tier 9 (Default: tier9)
* `t5_count`: Number of Tier 5 nodes to create. (Default: 1)
* `t8_count`: Number of Tier 8 nodes to create. (Default: 1)
* `t3_count`: Number of Tier 3 nodes to create. (Default: 1)
* `chef_env`: Required: Chef Environment
 (Default: _default)
* `t7_flavor`: Optional: Rackspace Cloud Server flavor to use. The size is based on the
amount of RAM for the provisioned server.
 (Default: 1 GB Performance)
* `t4_role`: Optional: Chef Role. Will default to "_default"
 (Default: _default)
* `t2_flavor`: Optional: Rackspace Cloud Server flavor to use. The size is based on the
amount of RAM for the provisioned server.
 (Default: 1 GB Performance)
* `t5_name`: Base name for Tier 5 (Default: tier5)
* `t3_flavor`: Optional: Rackspace Cloud Server flavor to use. The size is based on the
amount of RAM for the provisioned server.
 (Default: 1 GB Performance)
* `t7_name`: Base name for Tier 7 (Default: tier7)
* `t3_role`: Optional: Chef Role. Will default to "_default"
 (Default: _default)
* `t2_name`: Base name for Tier 2 (Default: tier2)
* `t5_flavor`: Optional: Rackspace Cloud Server flavor to use. The size is based on the
amount of RAM for the provisioned server.
 (Default: 1 GB Performance)
* `t5_role`: Optional: Chef Role. Will default to "_default"
 (Default: _default)
* `t6_flavor`: Optional: Rackspace Cloud Server flavor to use. The size is based on the
amount of RAM for the provisioned server.
 (Default: 1 GB Performance)
* `chef_version`: Optional: Version of Chef Client to use
 (Default: 11.16.0)
* `t2_role`: Optional: Chef Role. Will default to "_default"
 (Default: _default)
* `t8_name`: Base name for Tier 8 (Default: tier8)
* `t8_image`: Optional: Server image used for the server created
as a part of this deployment.
 (Default: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM))
* `t4_image`: Optional: Server image used for the server created
as a part of this deployment.
 (Default: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM))
* `t9_role`: Optional: Chef Role. Will default to "_default"
 (Default: _default)
* `t6_role`: Optional: Chef Role. Will default to "_default"
 (Default: _default)
* `chef_server_url`: Optional: Chef Server URL. Defaults to None, but the BASH script will
infer the Managed Chef URL from the organization
 (Default: '')
* `t9_image`: Optional: Server image used for the server created
as a part of this deployment.
 (Default: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM))
* `t7_role`: Optional: Chef Role. Will default to "_default"
 (Default: _default)
* `t2_count`: Number of Tier 2 nodes to create. (Default: 1)
* `t7_image`: Optional: Server image used for the server created
as a part of this deployment.
 (Default: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM))
* `t6_name`: Base name for Tier 6 (Default: tier6)
* `t3_name`: Base name for Tier 3 (Default: tier3)
* `t7_count`: Number of Tier 7 nodes to create. (Default: 1)
* `t6_count`: Number of Tier 6 nodes to create. (Default: 1)
* `validation_key`: Required: chef-client will attempt to use the private key assigned to the
chef-validator, located in /etc/chef/validation.pem. If, for any reason,
the chef-validator is unable to make an authenticated request to the
Chef server, the initial chef-client run will fail. Must be base64 encoded.
 (Default: None)
* `t3_image`: Optional: Server image used for the server created
as a part of this deployment.
 (Default: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM))
* `t8_flavor`: Optional: Rackspace Cloud Server flavor to use. The size is based on the
amount of RAM for the provisioned server.
 (Default: 1 GB Performance)
* `t9_count`: Number of Tier 9 nodes to create. (Default: 1)
* `organization`: Required: Chef organization
 (Default: '')
* `t4_flavor`: Optional: Rackspace Cloud Server flavor to use. The size is based on the
amount of RAM for the provisioned server.
 (Default: 1 GB Performance)
* `t5_image`: Optional: Server image used for the server created
as a part of this deployment.
 (Default: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM))
* `child_template`: (Default: https://raw.githubusercontent.com/rackops/heat-stack/master/stack_single.yaml)
* `t1_load_balancer`: Load Balancer that points to nodes in Tier 2. (Default: tier1LB)

Outputs
=======
Once a stack comes online, use `heat output-list` to see all available outputs.
Use `heat output-show <OUTPUT NAME>` to get the value of a specific output.

* `t5_public_ip`: Tier 5 Public IP 
* `private_key`: SSH Private Key 
* `t8_public_ip`: Tier 8 Public IP 
* `t1_loadbalancer`: Tier 1 Load Balancer IP 
* `t9_private_ip`: Tier 9 Private IP 
* `t5_private_ip`: Tier 5 Private IP 
* `t2_private_ip`: Tier 2 Private IP 
* `t6_private_ip`: Tier 6 Private IP 
* `t7_public_ip`: Tier 7 Public IP 
* `t7_private_ip`: Tier 7 Private IP 
* `t4_private_ip`: Tier 4 Private IP 
* `t8_private_ip`: Tier 8 Private IP 
* `t9_public_ip`: Tier 9 Public IP 
* `t3_public_ip`: Tier 3 Public IP 
* `t3_private_ip`: Tier 3 Private IP 
* `t2_public_ip`: Tier 2 Public IP 
* `t4_public_ip`: Tier 4 Public IP 
* `t6_public_ip`: Tier 6 Public IP 

For multi-line values, the response will come in an escaped form. To get rid of
the escapes, use `echo -e '<STRING>' > file.txt`. For vim users, a substitution
can be done within a file using `%s/\\n/\r/g`.
