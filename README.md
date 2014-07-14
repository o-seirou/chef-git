git Cookbook
============
This cookbook setup your git.
- install git
- execute git config [user.email|user.name]
- config github settings.

Environments
------------
Only test Ubuntu 14.04.

Attributes
----------
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['git']['email']</tt></td>
    <td>String</td>
    <td>Your git email</td>
    <td><tt>(none)</tt></td>
  </tr>
  <tr>
    <td><tt>['git']['name']</tt></td>
    <td>String</td>
    <td>Your git name</td>
    <td><tt>(none)</tt></td>
  </tr>
</table>

Usage
-----
- Include `git` in your node's `run_list`:
```json
{
  "name":"my_node",
  "run_list": [
    "recipe[git]"
  ]
}
```

- set attributes:
```json
{
  "git": {
    "email" : "foo@example.com",
    "name"  : "foo"
  }
}
```

- set private ssh key pair file on files/default/.ssh/id_rsa_github .

if your github ssh-private-key-file is ~/.ssh/id_rsa:
```sh
cp ~/.ssh/id_rsa files/default/.ssh/id_rsa_github
```

License
-------------------
MIT License.
