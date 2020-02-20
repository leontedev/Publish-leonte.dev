---
date: 2020-02-20 13:05
description: How to Set up SSH Keys on a Linux / Unix / MacOS System
tags: MacOS Linux SSH
---
# MacOS How to Set up SSH Keys

OpenSSH server supports various authentication schema. The two most popular are as follows:

- Passwords based authentication
- Public key based authentication. It is an alternative security method to using passwords. This method is recommended on a VPS, cloud, dedicated or even home based server.

## The Steps
1. Create the SSH keys public/private pair
2. Copy and install the public SSH key on the remote host.
3. Test & getting rid of the passphrase

## Generate the SSH Keys

```zsh
ssh-keygen -t rsa
```

You need to set the Key Pair location and name. I recommend you use the default location if you do not yet have another key there, for example: $HOME/.ssh/id_rsa. You will be prompted to supply a passphrase (password) for your private key. I suggest that you setup a passphrase when prompted, but this can be left blank. You should see two new files in $HOME/.ssh/ directory:

$HOME/.ssh/id_rsa– contains your private key.
$HOME/.ssh/id_rsa.pub – contain your public key.


## Copy the public key on the remote host

Use scp or ssh-copy-id command to copy your public key file (e.g., $HOME/.ssh/id_rsa.pub) to your account on the remote server/host.

```zsh
ssh-copy-id -i $HOME/.ssh/id_rsa.pub user@server1.domain.com
```

```zsh
scp $HOME/.ssh/id_rsa.pub user@server1.domain.com:~/.ssh/authorized_keys
```

## Test 

Now, try connecting using the command below.

```zsh
ssh -i ~/.ssh/id_rsa user@server1.domain.com
```

It might prompt you for a password. After the set up is complete, you should now be able to ssh directly, and if you configured a passphrase, that's what's going to be required. If no passphrase was configured for the SSH keys pair, it will login directly.

## Getting rid of the passphrase

To get rid of a passphrase for the current session, add a passphrase to ssh-agent and you will not be prompted for it when using ssh or scp/sftp/rsync to connect to hosts with your public key. 

```zsh
ssh-add
```

