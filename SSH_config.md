# How to configure your SSH Client

`ssh` obtains configuration data from the following sources in the following order:

1. command-line options
2. user's configuration file (~/.ssh/config)
3. system-wide configuration file (/etc/ssh/ssh_config)

The first obtained value for each configuration parameter will be used.

```bash
Host skeye 52.84.123.41
  User ubuntu
  HostName 52.84.123.41
  IdentityFile ~/.ssh/myawskey.pem
  ForwardX11 no
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
```

* [A Guide](* https://www.ssh.com/ssh/config/)
* [Example of a `~/.ssh/config` file which makes it easier to login to different servers](https://gist.github.com/vrillusions/9538779), [here is another example](https://www.cyberciti.biz/faq/create-ssh-config-file-on-linux-unix/)