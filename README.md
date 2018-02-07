# Dockerized Minecraft Server
## Usage
- Install [Docker](https://docs.docker.com/install/) and [Docker Compose](https://docs.docker.com/compose/install/).
- Download project files (this command puts them into `minecraft-server/` subdirectory by default):

      git clone https://github.com/snowwm/minecraft-server.git

- Edit `docker-compose.yml`. You would probably want to customize the following items:
  - `services.mcserver.volumes`: The binding `./data:/data` means that server files will be located in the `data/` directory *relative to `docker-compose.yml`*. You can specify any other path, like this: `/home/user/minecraft-srv:/data`. Or let docker create and manage the volume for you, like this: `volume-name:/data`.
  - `services.mcserver.environment`: You can fully customize your server here, even download Forge or Spigot and use custom Modpacks. Please refer to the author's [full documentation](https://hub.docker.com/r/itzg/minecraft-server/).
  - `services.rcon.hostname`: This ensures you can access admin console not only on `localhost`, but also remotely on your hostname, if you have one. You can replace `$HOSTNAME` with your actual hostname if for some reason the environment variable isn't properly set.
  - `services.rcon.environment`: Here you can set the username and password that will be used to access your administration console.
- Run `docker-compose up -d` in the directory with `docker-compose.yml` and you are done! You can omit the `-d` flag if you want to run it in the foreground and see the output. Otherwise, you can see it with `docker-compose logs -f`.

## Supported Platforms
This project was tested on Linux Mint and CentOS. You can contribute by telling about your expirience on different platforms in issues, PRs or via any other communication channel.

## Credits
This project is mainly a compilation of [itzg/minecraft-server](https://hub.docker.com/r/itzg/minecraft-server/) and [ekaomk/Minecraft-RCON-Console](https://github.com/ekaomk/Minecraft-RCON-Console). I've dockerized the latter and added basic HTTP authorization and reasonable default settings to make it as easy to set up as possible.

## Roadmap
- Server Management Script
  - Multiple instances
  - Backups
  - More goodies
