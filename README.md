# Introduction

This is my build of a container image for [cuckoo sandbox](https://cuckoo.sh/).

To pull this image, use the following command:

```bash
$ sudo docker pull <registry>/sainnhe/cuckoo:latest
```

Where `<registry>` is one of the following:

- [`docker.io`](https://hub.docker.com/repository/docker/sainnhe/cuckoo)
- [`ghcr.io`](https://github.com/sainnhe/cuckoo-container/pkgs/container/cuckoo)

Then clone this repository and run this image like this:

```bash
$ sudo docker run \
    -it \
    --rm \
    --name cuckoo \
    -v <path-to-this-repository>/conf:/root/.cuckoo/conf \
    -v /dev/vboxdrv:/dev/vboxdrv \
    -v /dev/vboxnetctl:/dev/vboxnetctl \
    <registry>/sainnhe/cuckoo:latest
```

Where `<path-to-this-repository>` is the path to this repository.

Make sure to have VirtualBox installed on your host machine and `/dev/vbox*` is accessible.

VBoxManage hostonlyif create
