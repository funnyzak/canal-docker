# Canal Docker

**Note**:

> This repository is no longer maintained. The latest built images can be found in the [Docker Release](https://github.com/funnyzak/docker-release?tab=readme-ov-file#alibaba-canal).
> 此仓库已不在维护，最新构建的镜像请查看 [Docker Release](https://github.com/funnyzak/docker-release?tab=readme-ov-file#alibaba-canal) 。

| Image | Tag | Size | Pulls |
|---|---|---|---|
| Canal-Adapter | [![Docker Tag](https://img.shields.io/docker/v/funnyzak/canal-adapter?label=Canal-Adapter&sort=semver&style=flat-square)](https://hub.docker.com/r/funnyzak/canal-adapter) | [![Docker Image Size](https://img.shields.io/docker/image-size/funnyzak/canal-adapter/latest?label=Canal-Adapter)](https://hub.docker.com/r/funnyzak/canal-adapter) | [![Docker Pulls](https://img.shields.io/docker/pulls/funnyzak/canal-adapter?label=Canal-Adapter)](https://hub.docker.com/r/funnyzak/canal-adapter) |
| Canal-Deployer | [![Docker Tag](https://img.shields.io/docker/v/funnyzak/canal-deployer?label=Canal-Deployer&sort=semver&style=flat-square)](https://hub.docker.com/r/funnyzak/canal-deployer) | [![Docker Image Size](https://img.shields.io/docker/image-size/funnyzak/canal-deployer/latest?label=Canal-Deployer)](https://hub.docker.com/r/funnyzak/canal-deployer) | [![Docker Pulls](https://img.shields.io/docker/pulls/funnyzak/canal-deployer?label=Canal-Deployer)](https://hub.docker.com/r/funnyzak/canal-deployer) |
| Canal-Admin | [![Docker Tag](https://img.shields.io/docker/v/funnyzak/canal-admin?label=Canal-Admin&sort=semver&style=flat-square)](https://hub.docker.com/r/funnyzak/canal-admin) | [![Docker Image Size](https://img.shields.io/docker/image-size/funnyzak/canal-admin/latest?label=Canal-Admin)](https://hub.docker.com/r/funnyzak/canal-admin) | [![Docker Pulls](https://img.shields.io/docker/pulls/funnyzak/canal-admin?label=Canal-Admin)](https://hub.docker.com/r/funnyzak/canal-admin) |


Alibaba Canal, a component for incremental subscription and consumption of binlogs in MySQL.  Images are built for `linux/amd64` and `linux/arm64` architectures, and based on Official [canal](https://github.com/alibaba/canal) repo.

All Images are installed under the `/opt/canal` directory.  For example, the `canal-adapter` service is installed under `/opt/canal/canal-adapter`.


This repository contains the following images:

- [canal-server](https://github.com/alibaba/canal/tree/master/server)
- [canal-adapter](https://github.com/alibaba/canal/tree/master/client-adapter)
- [canal-admin](https://github.com/alibaba/canal/tree/master/admin)

## Docker Pull

```bash
# Docker Hub
docker pull funnyzak/canal-adapter:latest
docker pull funnyzak/canal-deployer:latest
docker pull funnyzak/canal-admin:latest

# GitHub Container Registry (GHCR)
docker pull ghcr.io/funnyzak/canal-adapter:latest
docker pull ghcr.io/funnyzak/canal-deployer:latest
docker pull ghcr.io/funnyzak/canal-admin:latest

# Alibaba Cloud Container Registry
docker pull registry.cn-beijing.aliyuncs.com/funnyzak/canal-adapter:latest
docker pull registry.cn-beijing.aliyuncs.com/funnyzak/canal-deployer:latest
docker pull registry.cn-beijing.aliyuncs.com/funnyzak/canal-admin:latest
```

## Docker Images

### Canal Adapter

<!-- [![Docker Stars](https://img.shields.io/docker/stars/funnyzak/canal-adapter.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/canal-adapter/)
[![Docker Pulls](https://img.shields.io/docker/pulls/funnyzak/canal-adapter.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/canal-adapter/)
[![Docker Release Version](https://img.shields.io/docker/v/funnyzak/canal-adapter?sort=semver&label=latest)](https://hub.docker.com/r/funnyzak/canal-adapter/)
[![Image Size](https://img.shields.io/docker/image-size/funnyzak/canal-adapter)](https://hub.docker.com/r/funnyzak/canal-adapter/) -->

[Docker hub image: funnyzak/canal-adapter](https://hub.docker.com/r/funnyzak/canal-adapter)

**Docker Pull Command**: `docker pull funnyzak/canal-adapter:latest`

### Canal Server

<!-- [![Docker Stars](https://img.shields.io/docker/stars/funnyzak/canal-server.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/canal-server/)
[![Docker Pulls](https://img.shields.io/docker/pulls/funnyzak/canal-server.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/canal-server/)
[![Docker Release Version](https://img.shields.io/docker/v/funnyzak/canal-server?sort=semver&label=latest)](https://hub.docker.com/r/funnyzak/canal-server/)
[![Image Size](https://img.shields.io/docker/image-size/funnyzak/canal-server)](https://hub.docker.com/r/funnyzak/canal-server/) -->

[Docker hub image: funnyzak/canal-server](https://hub.docker.com/r/funnyzak/canal-server)

**Docker Pull Command**: `docker pull funnyzak/canal-server:latest`

### Canal Admin

<!-- [![Docker Stars](https://img.shields.io/docker/stars/funnyzak/canal-admin.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/canal-admin/)
[![Docker Pulls](https://img.shields.io/docker/pulls/funnyzak/canal-admin.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/canal-admin/)
[![Docker Release Version](https://img.shields.io/docker/v/funnyzak/canal-admin?sort=semver&label=latest)](https://hub.docker.com/r/funnyzak/canal-admin/)
[![Image Size](https://img.shields.io/docker/image-size/funnyzak/canal-admin)](https://hub.docker.com/r/funnyzak/canal-admin/) -->

[Docker hub image: funnyzak/canal-admin](https://hub.docker.com/r/funnyzak/canal-admin)

**Docker Pull Command**: `docker pull funnyzak/canal-admin:latest`

## Usage

### Docker

```bash
# canal server
docker run -d --name canal-server \
  -v /path/to/canal-server/conf:/opt/canal/canal-server/conf \
  -v /path/to/canal-server/logs:/opt/canal/canal-server/logs \
  funnyzak/canal-server:latest

# canal adapter
docker run -d --name canal-adapter \
  -v /path/to/canal-adapter/conf:/opt/canal/canal-adapter/conf \
  -v /path/to/canal-adapter/logs:/opt/canal/canal-adapter/logs \
  funnyzak/canal-adapter:latest

# canal admin
docker run -d --name canal-admin \
  -v /path/to/canal-admin/conf:/opt/canal/canal-admin/conf \
  -v /path/to/canal-admin/logs:/opt/canal/canal-admin/logs \
  funnyzak/canal-admin:latest
```

### Compose

```yaml
version: '3.7'
services:
  canal-server:
    image: funnyzak/canal-server:latest
    container_name: canal-server
    restart: on-failure
    environment:
      - canal.auto.scan=true
      - canal.destinations=example_destination
      - canal.instance.mysql.slaveId=166
      - canal.instance.master.address=mysql:3306
      - canal.instance.dbUsername=root
      - canal.instance.dbPassword=examplepwd123456
      - canal.instance.connectionCharset=UTF-8
      - canal.instance.tsdb.enable=true
      - canal.instance.gtidon=false
      - canal.instance.parser.parallelThreadSize=16
      - canal.instance.filter.regex=db_name.table_1,db_name.table_2
    volumes:
      - ./canal/canal-server/conf:/opt/canal/canal-server/conf
      - ./canal/canal-server/logs:/opt/canal/canal-server/logs
    networks:
      - my-network
    depends_on:
      - mysql
  canal-adapter:
    image: funnyzak/canal-adapter:latest
    container_name: canal-adapter
    restart: on-failure
    volumes:
      - ./canal/canal-adapter/conf:/opt/canal/canal-adapter/conf
      - ./canal/canal-adapter/logs:/opt/canal/canal-adapter/logs
    networks:
      - my-network
    depends_on:
      - canal-server
      - mysql
      - other storage...
  canal-admin:
    image: funnyzak/canal-admin:latest
    container_name: canal-admin
    restart: on-failure
    volumes:
      - ./canal/canal-admin/conf:/opt/canal/canal-admin/conf
      - ./canal/canal-admin/logs:/opt/canal/canal-admin/logs
    networks:
      - my-network
    depends_on:
      - canal-server
networks:
  default:
    external:
      name: my-network
```

More details about configuration, please refer to [canal](https://github.com/alibaba/canal).

## Docker Build

For building docker images, you can use the following command:

```bash
# build canal server
docker build \
--build-arg VCS_REF=`git rev-parse --short HEAD` \
--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
--build-arg CANAL_COMPONENT_VERSION="1.1.6" \
--build-arg CANAL_COMPONENT_NAME="canal-server" \
--build-arg CANAL_DOWNLOAD_NAME="canal.deployer" \
-t funnyzak/canal-server .

# build canal adapter
docker build \
--build-arg VCS_REF=`git rev-parse --short HEAD` \
--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
--build-arg CANAL_COMPONENT_VERSION="1.1.6" \
--build-arg CANAL_COMPONENT_NAME="canal-adapter" \
--build-arg CANAL_DOWNLOAD_NAME="canal.adapter" \
-t funnyzak/canal-adapter .

# build canal admin
docker build \
--build-arg VCS_REF=`git rev-parse --short HEAD` \
--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
--build-arg CANAL_COMPONENT_VERSION="1.1.6" \
--build-arg CANAL_COMPONENT_NAME="canal-admin" \
--build-arg CANAL_DOWNLOAD_NAME="canal.admin" \
-t funnyzak/canal-admin .
```

## Contribution

If you have any questions or suggestions, please feel free to submit an issue or pull request.

<a href="https://github.com/funnyzak/canal-docker/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=funnyzak/canal-docker" />
</a>

## License

MIT License © 2023 [funnyzak](https://github.com/funnyzak)
