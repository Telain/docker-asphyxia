#!/bin/sh
# Setting up savedata
SAVE_DIR="-d /usr/local/share/asphyxia/savedata"

[ ! -z "${ASPHYXIA_LISTENING_PORT}" ] && LISTENING_PORT="--port ${ASPHYXIA_LISTENING_PORT}" || LISTENING_PORT=""
[ ! -z "${ASPHYXIA_BINDING_HOST}" ] && BINDING_PORT="--bind ${ASPHYXIA_BINDING_HOST}" || BINDING_PORT=""
[ ! -z "${ASPHYXIA_MATCHING_PORT}" ] && MATCHING_PORT="--matching-port ${ASPHYXIA_MATCHING_PORT}" || MATCHING_PORT=""
[ ! -z "${ASPHYXIA_DEV_MODE}" ] && DEV_MODE="--dev" || DEV_MODE=""
[ ! -z "${ASPHYXIA_PING_IP}" ] && PING_IP="--ping-addr ${ASPHYXIA_PING_IP}" || PING_IP=""
[ ! -z "${ASPHYXIA_SAVEDATA_DIR}" ] && SAVEDATA_DIR="--savedata-dir ${ASPHYXIA_SAVEDATA_DIR}" || SAVEDATA_DIR=""

echo "RUNNING: /usr/local/share/asphyxia/asphyxia-core ${SAVE_DIR} ${LISTENING_PORT} ${BINDING_PORT} ${MATCHING_PORT} ${DEV_MODE} ${PING_IP} ${SAVEDATA_DIR}"
/usr/local/share/asphyxia/asphyxia-core ${SAVE_DIR} ${LISTENING_PORT} ${BINDING_PORT} ${MATCHING_PORT} ${DEV_MODE} ${PING_IP} ${SAVEDATA_DIR}
