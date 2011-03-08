CCNZ Map Generator
==================

This is a UI for generating printable maps on http://maps.eq.org.nz/

Updating the eq.org.nz categories
=================================

To update the available categories from eq.org.nz, run the following:

    rake eqnz:categories

Getting jobs to render
======================

The URL `/map_renders.txt` will return the next pending render job available
in a text format.  By default, the URL will return all pending jobs one per
line in the following format:

    render_id left_lon top_lat right_lon bot_lat paper_size include_index categories title

These parameters are as follows:

* `render_id` - The internal id of the render job.  You will need this to
  update the render status on completion.  An integer.
* `left_lon`, `top_lat`, `right_lon`, `bot_lat` - The bounding box of the map
* `paper_size` - The paper size to render, e.g. `a4`
* `orientation` - The paper orientation, `landscape` or `portrait`
* `include_index` - Whether to include the index, either `true` or `false`
* `categories` - A comma separated list of category ids from http://eq.org.nz/
* `title` - The map title

Below is an example of how to get jobs to render from a shell script:

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
