# docker-canal-adapter

![License](https://img.shields.io/github/license/funnyzak/canal-adapter-docker)
[![Docker Stars](https://img.shields.io/docker/stars/funnyzak/canal-adapter.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/canal-adapter/)
[![Docker Pulls](https://img.shields.io/docker/pulls/funnyzak/canal-adapter.svg?style=flat-square)](https://hub.docker.com/r/funnyzak/canal-adapter/)
[![Image Size](https://img.shields.io/docker/image-size/funnyzak/canal-adapter)](https://hub.docker.com/r/funnyzak/canal-adapter/)
[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/funnyzak/canal-adapter?label=latest)](https://hub.docker.com/r/funnyzak/canal-adapter/)

A docker image for [canal-adapter](https://github.com/alibaba/canal/tree/master/client-adapter).

Download size of this image is only:

[![Image Size](https://img.shields.io/docker/image-size/funnyzak/canal-adapter)](https://hub.docker.com/r/funnyzak/canal-adapter/)

[Docker hub image: funnyzak/canal-adapter](https://hub.docker.com/r/funnyzak/canal-adapter)

**Docker Pull Command**: `docker pull funnyzak/canal-adapter:latest`

## Usage

### Docker

```bash
docker run -d --name canal-adapter \
  -v /path/to/canal-adapter/conf:/opt/canal/canal-adapter/conf \
  -v /path/to/canal-adapter/logs:/opt/canal/canal-adapter/logs \
  -p 8081:8081 \
  funnyzak/canal-adapter:latest
```

### Compose

```yaml
version: '3.7'
services:
  canal-adapter:
    image: funnyzak/canal-adapter:latest
    container_name: canal-adapter
    restart: on-failure
    volumes:
      - ./canal/canal-adapter/conf:/opt/canal/canal-adapter/conf
      - ./canal/canal-adapter/logs:/opt/canal/canal-adapter/logs
```

More details about configuration, please refer to [canal-adapter](https://github.com/alibaba/canal/tree/master/client-adapter).

## Contribution

If you have any questions or suggestions, please feel free to submit an issue or pull request.

<a href="https://github.com/funnyzak/canal-adapter-docker/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=funnyzak/canal-adapter-docker" />
</a>

## License

MIT License © 2023 [funnyzak](https://github.com/funnyzak)
