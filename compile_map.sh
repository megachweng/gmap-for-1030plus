#!/bin/bash
mkgmap_dir="/mnt/d/Programs/garmin_map/mkgmap/mkgmap.jar"

absolute_project_dir="/mnt/e/project/gmap-for-1030plus"
resources_dir="$absolute_project_dir/resources"

bounds_file="$resources_dir/bounds-latest.zip"
sea_file="$resources_dir/sea-latest.zip"

style_name="edge"
typ_name="edge.typ"

out_dir="$absolute_project_dir/product"

############################################
#                Get start                 #
############################################
mkdir -p $out_dir
rm -rf $out_dir/*



############################################
#               Mkgmap args                #
############################################
java -Xmx10g -ea -jar $mkgmap_dir \
    --max-jobs=12 \
    --check-styles \
    --code-page=936 \
    --output-dir=$out_dir \
    --bounds=$bounds_file \
    --precomp-sea=$sea_file \
    --style-file=$absolute_project_dir/styles/$style_name \
    --family-id=980 \
    --family-name="Megachweng's OSM for Garmin Edge devices" \
    --product-id=1 \
    --series-name="OSM Garmin Edge" \
    --area-name="China" \
    --location-autofill=is_in,nearest \
    --country-name=China \
    --country-abbr=CHN \
    --gmapsupp \
    --add-pois-to-areas \
    --add-pois-to-lines \
    --index \
    --split-name-index \
    --housenumbers \
    --draw-priority=25 \
    --generate-sea=land-tag=natural=background \
    --ignore-turn-restrictions \
    --route \
    --link-pois-to-ways \
    --polygon-size-limits="24:12, 18:10, 16:8, 14:4, 12:2, 11:0" \
    --reduce-point-density-polygon=8 \
    --min-size-polygon=4 \
    --tdbfile \
    --merge-lines \
    --preserve-element-order \
    --read-config=$absolute_project_dir/map.args \
    --verbose \
    $absolute_project_dir/typ/$typ_name