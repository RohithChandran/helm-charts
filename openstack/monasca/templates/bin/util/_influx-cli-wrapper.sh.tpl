#!/bin/bash

MONASCA_INFLUX_COMMAND='/usr/bin/influx'

$MONASCA_INFLUX_COMMAND -username mon_api -password {{.Values.monasca_influxdb_monapi_password}} -database mon -execute "$*"
