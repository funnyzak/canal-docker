FROM funnyzak/alpine-glibc AS build

ARG CANAL_DOWNLOAD_NAME canal.adapter
ARG CANAL_COMPONENT_NAME canal-adapter
ARG CANAL_COMPONENT_VERSION 1.1.6

ENV CANAL_ADAPTER_DOWNLOAD_URL https://github.com/alibaba/canal/releases/download/canal-${CANAL_COMPONENT_VERSION}/${CANAL_DOWNLOAD_NAME}-${CANAL_COMPONENT_VERSION}.tar.gz

RUN apk add curl tar \
    && mkdir -p /opt/canal/${CANAL_COMPONENT_NAME} \
    && curl -fSL "$CANAL_ADAPTER_DOWNLOAD_URL"  -o ${CANAL_DOWNLOAD_NAME}.tar.gz \
    && tar -xzf ${CANAL_DOWNLOAD_NAME}.tar.gz -C /opt/canal/${CANAL_COMPONENT_NAME} \
    && rm ${CANAL_DOWNLOAD_NAME}.tar.gz* \
    && apk del curl tar


FROM openjdk:11-jre

ARG BUILD_DATE
ARG VCS_REF
ARG CANAL_COMPONENT_VERSION 1.1.6
ARG CANAL_COMPONENT_NAME canal-adapter

LABEL org.label-schema.vendor="Leon<silenceace@gmail.com>" \
    org.label-schema.name="${CANAL_COMPONENT_NAME}" \
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.description="${CANAL_COMPONENT_NAME}." \
    org.label-schema.url="https://yycc.me" \
    org.label-schema.schema-version="${CANAL_COMPONENT_VERSION}"	\
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-ref="${VCS_REF}" \
    org.label-schema.vcs-url="https://github.com/funnyzak/canal-docker" 

ENV TZ Asia/Shanghai
ENV LC_ALL C.UTF-8
ENV LANG=C.UTF-8

COPY --from=build /opt/canal/${CANAL_COMPONENT_NAME} /opt/canal/${CANAL_COMPONENT_NAME}

WORKDIR /opt/canal/${CANAL_COMPONENT_NAME}

ADD scripts/${CANAL_COMPONENT_NAME}.sh /run_scripts/entrypoint.sh
RUN chmod +x /run_scripts/*.sh

ENTRYPOINT ["/run_scripts/entrypoint.sh"]