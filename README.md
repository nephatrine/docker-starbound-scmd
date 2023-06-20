[Git](https://code.nephatrine.net/NephNET/docker-starbound-scmd/src/branch/master) |
[Docker](https://hub.docker.com/r/nephatrine/starbound-scmd/) |
[unRAID](https://code.nephatrine.net/nephatrine/unraid-containers)

# Starbound Dedicated Game Server

This docker image contains a Starbound server to self-host your own game.

## Docker-Compose

This is an example docker-compose file:

```yaml
services:
  starbound:
    image: nephatrine/starbound-scmd:latest
    container_name: starbound
    ports:
      - "21025:21025/tcp"
      - "21025:21025/udp"
      - "21026:21026/tcp"
    volumes:
      - /mnt/containers/starbound:/opt/starbound-dedicated
```

## Game Installation w/ SteamCMD

The installation uses **SteamCMD** and so will need your Steam credentials and
SteamGuard 2FA. Due to this, it cannot be automated. On initial startup, it
will sleep in a loop waiting for the installation.

You can enter the container's terminal and run the `starbound-install.sh`
script. This script takes one argument - your Steam username. It will query you
for your Steam password and 2FA login to begin the installation or update
process. Once this is complete, the game server will be automatically started.

## Steam Workshop Mods

Steam Workshop mod IDs can be listed in a `workshop.txt` file in the root of
the game directory. If it exists, the installation script will also download
and install those. If the game is already installed and you just wish to
install the mods listed there, you can run `starbound-install-workshop.sh`
instead. Mod uninstallation must be done manually by removing the symlink in
the mods folder.

## Server Configuration

Once the game has been installed and started for the first time, a
`starbound_server.config` file will be created where you can configure the
particulars for your server.
