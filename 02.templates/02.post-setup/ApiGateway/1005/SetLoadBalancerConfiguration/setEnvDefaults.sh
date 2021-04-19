#!/bin/sh

export SUIF_APIGW_ADMINISTRATOR_PASSWORD=${SUIF_APIGW_ADMINISTRATOR_PASSWORD:-"manage"}

export SUIF_APIGW_URL_PROTOCOL=${SUIF_APIGW_URL_PROTOCOL:-"http"}
export SUIF_APIGW_DOMAINNAME=${SUIF_APIGW_DOMAINNAME:-"localhost"}
export SUIF_APIGW_SERVICE_PORT=${SUIF_APIGW_SERVICE_PORT:-"5555"}

export SUIF_APIGW_LB_JSON_FILE=${SUIF_APIGW_LB_JSON_FILE:-"/tmp/must_give_an_lb_json_file"}