require 'test_helper'

class MapTest < ActiveSupport::TestCase
  def setup
    @map = Factory.create(:map)
  end

  test "should get bounds" do
    assert_equal "-43.0,170.0:-44.0,171.0", @map.bounds
  end

  test "should not save without a title" do
    @map.title = ''
    assert !@map.save
  end

  test "should not save invalid paper size" do
    @map.paper_size = ''
    assert !@map.save
    @map.paper_size = 'a7'
    assert !@map.save
  end

  test "should not save without all bounds" do
    [:left, :right, :top, :bottom].each do |bound|
      assert !Factory.build(:map, bound => nil).save
    end
  end

  test "should create a map render on create" do
    assert_difference 'MapRender.count', 1 do
      Factory.create(:map)
    end
  end
end
