# Asphyxia Docker Image #
[Asphyxia](https://asphyxia-core.github.io/)

Latest is running 1.50 of [Asphyxia](https://asphyxia-core.github.io/) and 0.5 of the [Official Plugins](https://github.com/asphyxia-core/plugins)

## Source ##
[github](https://github.com/edgar131/docker-asphyxia)

## Usage ##
```
$ docker-compose up
```
Or to run detached:
```
$ docker-compose up -d
```

## Environment Variables ##
The following variables are passed as arguments to Asphyxia and will override any config.ini settings

- **ASPHYXIA_LISTENING_PORT** - Override the listening port at runtime ("-p")
- **ASPHYXIA_BINDING_HOST** - Override binding host at runtime ("-b")
- **ASPHYXIA_MATCHING_PORT** - Override matching port at runtime ("-m")
- **ASPHYXIA_DEV_MODE** - Enable dev mode (buggy?) ("--dev")
- **ASPHYXIA_PING_IP** - Override ping IP address at runtime ("-pa")
- **ASPHYXIA_SAVEDATA_DIR** - Override savedata directory at runtime ("-d")

## Mount Point ##
The local mount point for overrides within the container is /usr/local/share/asphyxia. Define the volume and save any plugins to the plugins folder of that volume.
```
volumes:
      - "./asphyxia:/usr/local/share/asphyxia"
```

You can replace "./asphyxia" with any directory on your machine that contains your config.ini/plugins/savedata directories.

Place a Asphyxia config.ini file in the directory you have mounted to /usr/local/share/custom

## Notes ##
Always ensure you open up both the listening port and the matching port (if you intend to do any matching) or you will not be able to access the web GIU or utilize Asphyxia in general.
Example:
```
ports:
      - "8083:8083"
      - "5700:5700"
```

While the default configuration that Asphyxia generates specifies the binding host as "localhost", I have found that in docker it typically doesn't work unless specified as "**0.0.0.0**".  If you aren't able to access the web GUI after running the container, you should either specify the **ASPHYXIA_BINDING_HOST** environment variable as "**0.0.0.0**" or change the binding host in your custom mounted config.ini as "**0.0.0.0**".

## Sample docker-compose.yml ##
[docker-compose.yml](https://github.com/edgar131/docker-asphyxia/blob/master/docker-compose.yml)
```
version: "3.9"

services:
  asphyxia:
    image: edgar131/asphyxia:latest
    build: .
    environment:
      - ASPHYXIA_LISTENING_PORT=
      - ASPHYXIA_BINDING_HOST=0.0.0.0
      - ASPHYXIA_MATCHING_PORT=
      - ASPHYXIA_DEV_MODE=
      - ASPHYXIA_PING_IP=
      - ASPHYXIA_SAVEDATA_DIR=
      - ASPHYXIA_PLUGIN_REPLACE=
    ports:
      - "8083:8083"
      - "5700:5700"
    volumes:
      - "./asphyxia:/usr/local/share/custom"
```
