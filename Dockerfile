FROM FROM funnyzak/alpine-glibc AS build

ARG CANAL_ADAPTER_VERSION=1.1.6
ENV CANAL_ADAPTER_DOWNLOAD_URL https://github.com/alibaba/canal/releases/download/canal-${CANAL_ADAPTER_VERSION}/canal.adapter-${CANAL_ADAPTER_VERSION}.tar.gz

RUN apk add curl tar \
    && mkdir -p /opt/canal/adapter \
    && curl -fSL "$CANAL_ADAPTER_DOWNLOAD_URL" -o canal.adapter.tar.gz \
    && tar -xzf canal.adapter.tar.gz -C /opt/canal/adapter --strip-components=1 \
    && rm canal.adapter.tar.gz* \
    && apk del curl tar


FROM openjdk:11-jre-slim

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.vendor="potato<silenceace@gmail.com>" \
    org.label-schema.name="CANAL-ADAPTER" \
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.description="canal adapter client." \
    org.label-schema.url="https://yycc.me" \
    org.label-schema.schema-version="${CANAL_ADAPTER_VERSION}"	\
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-ref="${VCS_REF}" \
    org.label-schema.vcs-url="https://github.com/funnyzak/canal-adapter-docker" 

ENV TZ Asia/Shanghai
ENV LC_ALL C.UTF-8
ENV LANG=C.UTF-8
ENV CANAL_ADAPTER_VERSION ${CANAL_ADAPTER_VERSION}
ENV CANAL_ADAPTER_HOME /opt/canal/adapter

RUN mkdir -p /opt/canal/adapter
COPY --from=build /opt/canal/adapter /opt/canal/adapter

ADD scripts /run_scripts
RUN chmod +x /run_scripts/*.sh

WORKDIR /opt/canal/adapter

ENTRYPOINT ["/run_scripts/entrypoint.sh"]
