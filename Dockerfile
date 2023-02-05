FROM funnyzak/alpine-glibc AS build

ARG CANAL_ADAPTER_VERSION
ENV CANAL_ADAPTER_DOWNLOAD_URL https://github.com/alibaba/canal/releases/download/canal-${CANAL_ADAPTER_VERSION}/canal.adapter-${CANAL_ADAPTER_VERSION}.tar.gz

RUN apk add curl tar \
    && mkdir -p /opt/canal/canal-adapter \
    && curl -fSL "$CANAL_ADAPTER_DOWNLOAD_URL"  -o canal.adapter.tar.gz \
    && tar -xzf canal.adapter.tar.gz -C /opt/canal/canal-adapter \
    && rm canal.adapter.tar.gz* \
    && apk del curl tar


FROM openjdk:11-jre
ARG BUILD_DATE
ARG VCS_REF
ARG CANAL_ADAPTER_VERSION

LABEL org.label-schema.vendor="potato<silenceace@gmail.com>" \
    org.label-schema.name="canal-adapter-client" \
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

COPY --from=build /opt/canal/canal-adapter /opt/canal/canal-adapter

WORKDIR /opt/canal/canal-adapter

ADD entrypoint.sh /run_scripts/entrypoint.sh
RUN chmod +x /run_scripts/*.sh

ENTRYPOINT ["/run_scripts/entrypoint.sh"]