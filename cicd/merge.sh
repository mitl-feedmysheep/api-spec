# #!/bin/sh

# json_dir=./dist/api-spec-json
# specification_dir=./specification
# url_mapper_data_prefix="{\"urls\": ["
# url_mapper_data_postfix="]}"
# url_mapper_data=""

# # Define a function
# check_directory_exists() {
#   echo "####################################################"
#   if [ ! -d $json_dir ];
#   then
#     echo "# make $json_dir directory"
#     mkdir $json_dir
#   else
#     echo "# delete $json_dir directory and remake"
#     rm -rf $json_dir
#     mkdir $json_dir
#   fi
#   echo "####################################################"
#   echo ""
# }

# merge_all_yaml_file() {
#   echo "####################################################"
#   echo "# merge all yaml file into one json file"
#   echo "####################################################"
#   echo ""
#   yq eval-all -o=json '. as $paths ireduce ({}; . * $paths)' "$specification_dir"/*/*.yaml > "$json_dir"/all.json
#   url_mapper_data="{\"name\":\"all\",\"url\":\"all.json\"}"
# }

# create_json_file_by_sub_directory() {
#   echo "####################################################"
#   echo "# create json file by sub directory"
#   echo "####################################################"
#   echo ""

#   for sub_specification_dir in "$specification_dir"/*
#   do
#     sub_dir_name="$(basename "$sub_specification_dir")"
#     yaml_path="$specification_dir"/"$sub_dir_name"/*.yaml
#     count=`ls -1 ${yaml_path} 2>/dev/null | wc -l`
#     if [ $count != 0 ]; then
#       url_mapper_data="${url_mapper_data}, {\"name\":\"${sub_dir_name}\",\"url\":\"${sub_dir_name}.json\"}"
#       yq eval-all -o=json '. as $paths ireduce ({}; . * $paths)' "$specification_dir"/"$sub_dir_name"/*.yaml > "$json_dir"/"$sub_dir_name".json
#     fi
#   done
#   echo "${url_mapper_data_prefix} ${url_mapper_data} ${url_mapper_data_postfix}" > $json_dir/url-mapper.json
# }

# # Invoke a function
# check_directory_exists
# merge_all_yaml_file
# create_json_file_by_sub_directory
