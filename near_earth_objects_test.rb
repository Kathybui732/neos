require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'near_earth_objects'

class NearEarthObjectsTest < Minitest::Test
  def setup
    NearEarthObjects.find_neos_by_date('2019-03-30')
  end

  def test_a_date_returns_a_list_of_neos
    results = NearEarthObjects.find_neos_by_date('2019-03-30')
    assert_equal '(2019 GD4)', results[:astroid_list][0][:name]
  end

  def test_it_can_create_conn
    assert_instance_of Faraday::Connection, NearEarthObjects.conn
  end

  def test_it_can_get_faraday_responce
    assert_instance_of Faraday::Response,
    NearEarthObjects.asteroids_list_data
  end

  def test_it_can_parse_asteroids_data
    assert_equal Array, NearEarthObjects.parsed_asteroids_data.class
    assert_equal 12, NearEarthObjects.parsed_asteroids_data.count
  end

  def test_it_can_find_largest_astroid_diameter
    assert_equal 10233, NearEarthObjects.largest_astroid_diameter
  end

  def test_it_can_calculate_total_number_of_astroids
    assert_equal 12, NearEarthObjects.total_number_of_astroids
  end

  def test_it_can_format_asteroid_data
    results =  [
              {:name=>"(2019 GD4)", :diameter=>"61 ft", :miss_distance=>"911947 miles"},
             {:name=>"(2019 GN1)", :diameter=>"147 ft", :miss_distance=>"9626470 miles"},
             {:name=>"(2019 GN3)", :diameter=>"537 ft", :miss_distance=>"35277204 miles"},
             {:name=>"(2019 GB)", :diameter=>"81 ft", :miss_distance=>"553908 miles"},
             {:name=>"(2019 FQ2)", :diameter=>"70 ft", :miss_distance=>"2788140 miles"},
             {:name=>"(2011 GE3)", :diameter=>"123 ft", :miss_distance=>"35542652 miles"},
             {:name=>"(2019 FT)", :diameter=>"512 ft", :miss_distance=>"5503325 miles"},
             {:name=>"(2019 FS1)", :diameter=>"134 ft", :miss_distance=>"6241521 miles"},
             {:name=>"141484 (2002 DB4)", :diameter=>"10233 ft", :miss_distance=>"37046029 miles"},
             {:name=>"(2011 GK44)", :diameter=>"147 ft", :miss_distance=>"10701438 miles"},
             {:name=>"(2012 QH8)", :diameter=>"1071 ft", :miss_distance=>"37428269 miles"},
             {:name=>"(2019 UZ)", :diameter=>"51 ft", :miss_distance=>"37755577 miles"}
           ]
      assert_equal results, NearEarthObjects.formatted_asteroid_data
  end
end
