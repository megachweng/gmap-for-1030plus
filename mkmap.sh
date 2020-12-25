#!/bin/bash
PROJECT_DIR="$HOME/project/garmin"
PATH_TO_MKGMAP="$PROJECT_DIR/bin/mkgmap/mkgmap.jar"
STYLE_FILE="$PROJECT_DIR/styles/roadquest"
ARGS="$PROJECT_DIR/mkgmap.args"
TYP_FILE="$PROJECT_DIR/typ/road.typ"
RESOURCES_DIR="$PROJECT_DIR/resources"

BOUNDS="$RESOURCES_DIR/bounds-latest.zip"
SEA="$RESOURCES_DIR/sea-latest.zip"

OUTDIR="$PROJECT_DIR/product"

mkdir $OUTDIR
rm -rf $OUTDIR/*

java -Xmx10g -ea -jar $PATH_TO_MKGMAP \
  --style-file=$STYLE_FILE \
  --max-jobs=12 \
  --output-dir=$OUTDIR \
  -c $ARGS \
  --bounds=$BOUNDS \
  --precomp-sea=SEA \
  --check-styles \
  $TYP_FILE
