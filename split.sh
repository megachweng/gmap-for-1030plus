#!/bin/bash

PROJECT_DIR="$HOME/project/garmin"
PATH_TO_SPLITTER="$PROJECT_DIR/bin/splitter/splitter.jar"
RESOURCES_DIR="$PROJECT_DIR/resources"
OUTDIR="$PROJECT_DIR/splitted"
PRECOMP_SEA="$RESOURCES_DIR/sea-latest.zip"
GEO_NAME_FILE="$RESOURCES_DIR/cities15000.txt"
MAX_NODES=1600000
TILE_FILE="$PROJECT_DIR/tiles/china-latest.osm.pbf"
POLY="$RESOURCES_DIR/china.poly"
mkdir -p $OUTDIR
rm -rf $OUTDIR/*

java -Xmx10g -ea -jar $PATH_TO_SPLITTER --max-nodes=$MAX_NODES --output-dir=$OUTDIR --precomp-sea=$PRECOMP_SEA --geonames-file=$GEO_NAME_FILE --polygon-file=$POLY $TILE_FILE