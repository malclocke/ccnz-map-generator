require 'test_helper'

class MapRenderTest < ActiveSupport::TestCase
  def setup
    @map_render = Factory.create(:map_render)
  end

  test "should not save without URL if not complete" do
    @map_render.url = ''
    assert @map_render.save
    @map_render.status = 'complete'
    assert !@map_render.save
  end

  test "should return a string of render options" do
    # map_render_id left top right bottom paper_size include_index categories title
    @map_render.map.categories << Factory.create(:category)
    @map_render.map.categories << Factory.create(:category)
    category_ids = @map_render.map.category_ids.join(',')
    assert_equal "#{@map_render.id} 170.0 -43.0 171.0 -44.0 a4 true #{category_ids} Test Map",
      @map_render.to_s
  end
end
