ARG NODEJS_IMAGE=node:current-alpine

FROM $NODEJS_IMAGE

LABEL org.opencontainers.image.source="https://github.com/fluxapps/flux-ilias-chatroom-base"
LABEL maintainer="fluxlabs <support@fluxlabs.ch> (https://fluxlabs.ch)"

COPY . /flux-ilias-chatroom-base

ENTRYPOINT ["/flux-ilias-chatroom-base/bin/entrypoint.sh"]

ENV ILIAS_COMMON_CLIENT_ID default
ENV ILIAS_FILESYSTEM_DATA_DIR /var/iliasdata
ENV ILIAS_WEB_DIR /var/www/html

ENV ILIAS_CHATROOM_CLIENT_CONFIG_FILE $ILIAS_FILESYSTEM_DATA_DIR/$ILIAS_COMMON_CLIENT_ID/chatroom/client.cfg
ENV ILIAS_CHATROOM_SERVER_CONFIG_FILE $ILIAS_FILESYSTEM_DATA_DIR/$ILIAS_COMMON_CLIENT_ID/chatroom/server.cfg

ENV ILIAS_CHATROOM_PORT 8080

VOLUME $ILIAS_FILESYSTEM_DATA_DIR

EXPOSE $ILIAS_CHATROOM_PORT
