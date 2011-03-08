base_url=http://localhost:3000

curl -s -o - $base_url/map_renders.txt | \
  while read id left top right bottom paper_size include_index categories title
  do
    echo "Rendering map $title at paper size $paper_size"

    # Update the job to mark it as started
    curl -o - -X PUT -d map_render[status]=started $base_url/map_renders/$id.txt

    # Run the render script ...
    url=http://example.com/foo.pdf

    # Mark the render as complete and set the url
    curl -o - -X PUT -d "map_render[status]=complete&map_render[url]=$url" $base_url/map_renders/$id.txt

  done
