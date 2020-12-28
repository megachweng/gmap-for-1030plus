#!/bin/bash


max_nodes=1600000
splitter_dir="/mnt/d/Programs/garmin_map/splitter/splitter.jar"
absolute_project_dir="/mnt/e/project/gmap-for-1030plus"
resources_dir="$absolute_project_dir/resources"
sea_file="$resources_dir/sea-latest.zip"
geo_name_file="$resources_dir/cities15000.txt"
out_dir="$absolute_project_dir/splitted"

tile_file_name="zhejiang.osm"
poly_file_name="china.poly"

mkdir -p $out_dir
rm -rf $out_dir/*


java -Xmx10g -ea -jar $splitter_dir \
    --max-nodes=$max_nodes \
    --output-dir=$out_dir \
    --precomp-sea=$sea_file \
    --geonames-file=$geo_name_file \
    --polygon-file=$resources_dir/$poly_file_name \
    $absolute_project_dir/tiles/$tile_file_name