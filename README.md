# Samba Docker container for Raspberry PI

This project builds a Raspberry PI Docker container embedding a Samba server.
This container allows you to share files over network using SMB protocol, used by Windows clients.

## Build instructions

[Install Docker](https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi) on a Raspberry PI host.

Build a Docker image using this command:

    $ make

A Docker image named 'rpi-samba' is now available.
Create a new Docker container from this image:

    $ sudo docker create --name rpi-samba --restart always -v $PWD/public:/data/share -p 445:445 -p 139:139 -p 137:137/udp -p 138:138/udp rpi-samba

You are now ready to start this container:

    $ sudo docker start rpi-samba

The Docker container exports a public network share named 'Public', linked to a local directory using a Docker volume.
The Samba share is using the directory <code>/data/share</code> in the Docker image.
Tweak the command line argument <code>-v /your/local/dir:/data/share</code> to set a specific directory.

## Copyright

This program is a free software published under GPL.
Copyright (c) 2017 Alexandre Roman.

