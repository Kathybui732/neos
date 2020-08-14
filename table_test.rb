require "minitest/autorun"
require "minitest/pride"
require_relative "table"
require_relative "near_earth_objects"

class TableTest < MiniTest::Test

  def test_it_exists_with_attributes
    table ||= Table.new('2019-03-30')
    assert_instance_of Table, table
  end

  def test_it_can_generate_astroid_list
    table ||= Table.new('2019-03-30')
    assert_equal Array, table.astroid_list.class
    assert_equal 12, table.astroid_list.count
  end

  def test_it_can_count_total_number_of_astroids
    table ||= Table.new('2019-03-30')
    assert_equal 12, table.total_number_of_astroids
  end

  def test_largest_astroid
    table ||= Table.new('2019-03-30')
    assert_equal 10233, table.largest_astroid
  end

  def test_it_can_create_column_data
    table ||= Table.new('2019-03-30')
    result = {:name=>{:label=>"Name", :width=>17}, :diameter=>{:label=>"Diameter", :width=>8}, :miss_distance=>{:label=>"Missed The Earth By:", :width=>20}}
    assert_equal result, table.column_data
  end
end
