base_url=http://localhost:3000
render_script=ocitysmap/ocitysmap2-render
output_dir=/tmp
output_base_url=http://maps.eg.org.nz/blah

set -e

curl -s -o - $base_url/map_renders.txt | \
  while read id left top right bottom paper_size orientation include_index categories title
  do
    echo "Rendering map $title at paper size $paper_size"

    # Update the job to mark it as started
    curl -o - -X PUT -d map_render[status]=started $base_url/map_renders/$id.txt

    # Work out where to put the index, if at all
    if [ "$include_index" == "true" ] ; then
      if [ "$orientation" == "portrait" ] ; then
        minus_l=single_page_index_bottom
      else
        minus_l=single_page_index_side
      fi
    else
      minus_l=plain
    fi

    # Run the render script ...
    filename="$title-$id.pdf"
    url="$output_base_url/$filename"

    cat <<EOT
    $render_script  -L en_NZ.UTF-8 -b $top,$left $bot,$right \
                    --paper-format=$paper_size -t "$title" -o $orientation \
                    -l $minus_l -p "$output_dir/$filename"
EOT

    # Mark the render as complete and set the url
    curl -o - -X PUT -d "map_render[status]=complete&map_render[url]=$url" $base_url/map_renders/$id.txt

  done
