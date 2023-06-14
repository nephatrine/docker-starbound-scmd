[Git](https://code.nephatrine.net/NephNET/docker-starbound-scmd/src/branch/master) |
[Docker](https://hub.docker.com/r/nephatrine/starbound-scmd/) |
[unRAID](https://code.nephatrine.net/nephatrine/unraid-containers)

# Starbound Server

This docker image contains a Starbound server to self-host your own game.

You can spin up a quick temporary test container like this:

~~~
docker run --rm -p 21025:21025 -it nephatrine/starbound-scmd:latest /bin/bash
~~~

The installation uses **SteamCMD** and so will need your Steam credentials and
SteamGuard 2FA. Due to this, it cannot be automated. On startup, if not
installed yet the startup script will sleep in a loop waiting for the
installation. You can perform the installation by going into the container
console and running `starbound-install.sh`. This will install/update Starbound
and interactively have you log in. Any mods listed in the `workshop.txt` file
in the game directory will be installed at this time as well.

Alternatively, you can manually copy of the Linux game files and create a
`.ready` file in the game directory.

## Persistent Mounts

You can provide a persistent mountpoint using the ``-v /host/path:/container/path``
syntax. These mountpoints are intended to house important configuration files,
logs, and application state (e.g. databases) so they are not lost on image
update.

- ``/opt/starbound-dedicated``: Steam Game Data.

You can perform some basic configuration of the container using the files and
directories listed below.

- ``/opt/starbound-dedicated/storage/starbound_server.config``: Server Configuration [*]
- ``/opt/starbound-dedicated/workshop.txt``: List Of Steam Workshop IDs

**[*] Changes to some configuration files may require service restart to take
immediate effect.**

## Network Services

This container runs network services that are intended to be exposed outside
the container. You can map these to host ports using the ``-p HOST:CONTAINER``
or ``-p HOST:CONTAINER/PROTOCOL`` syntax.

- ``21025/tcp``: Game Server.
