require "./plate.rb"
require 'date'
require "test/unit"

class TestPlate < Test::Unit::TestCase

    def test_plate()
        plate = Plate.new("PBA-1504")
        assert_equal("PBA-1504", plate.value)
    end

    def test_plate_validate()
        plate = Plate.new("PBA-1504")
		assert(plate.valid)
		plate = Plate.new("PbA-1504")
		assert(!plate.valid)
		plate = Plate.new("PbA-504")
		assert(!plate.valid)
		plate = Plate.new("pba-0504")
		assert(!plate.valid)
		plate = Plate.new("PBA0504")
		assert(!plate.valid)
    end

    def test_canRoad()
	
		# Monday at 10:00 plate license number whith the lastest digit 1 or 2 can road
		plate = Plate.new("PBA-1503")
		date = DateTime.new(2016,5,30,10,0)
		assert(plate.canRoad(date))
		
		# Tuesday at 8:00 plate license number whith the lastest digit 3 or 4 can´t road
		plate = Plate.new("PBA-1503")
		date = DateTime.new(2016,5,31,8,0)
		assert(!plate.canRoad(date))
		
		# Wednesday at 17:00 plate license number whith the lastest digit 5 or 6 can't road
		plate = Plate.new("PBA-1506")
		date = DateTime.new(2016,5,25,17,0)
		assert(!plate.canRoad(date))
		
		# Thursday at 21:00 plate license number whith the lastest digit 7 or 8 can road
		plate = Plate.new("PBA-1508")
		date = DateTime.new(2016,5,26,21,0)
		assert(plate.canRoad(date))
		
		# Saturday at 8:00 plate license number whith the lastest digit 3 or 4 can road
		plate = Plate.new("PBA-1503")
		date = DateTime.new(2016,5,28,8,0)
		assert(plate.canRoad(date))
    end
end