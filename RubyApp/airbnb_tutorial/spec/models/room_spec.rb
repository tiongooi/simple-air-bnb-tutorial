require 'rails_helper'

RSpec.describe Room, type: :model do

  it "room can save an image" do
  	room = Room.create(:title => "most expensive airbnb apartment")
  	room.images = [
  		file_fixture("myroom.jpg").open
  	]
  	room.save!
#require 'pry'; binding.pry  	

	expect(room.images.count).to eq(1)
  end


  it "room require a title" do
  	room = Room.create(:title => nil)
	expect(room).to_not be_valid  	
  end

  it "room require a title of atleast 2 characters" do
  	room = Room.create(:title => "a")
	expect(room).to_not be_valid  	
  end

  it "room require a title of atleast 2 characters" do
  	room = Room.create(:title => "ab")
	expect(room).to be_valid  	
  end

  it "fancy room price estimator" do
  	skip "do later"
  	 room_with_wifi_and_no_pets = Room.create(:wifi => true, :pets => false)
  	 price = room_with_wifi_and_no_pets.fancy_price_estimator
  	 expect(price).to eq(135)

  	 room_with_wifi_and_pets = Room.create(:wifi => true, :pets => true)
  	 price = room_with_wifi_and_pets.fancy_price_estimator
  	 expect(price).to eq(185)
  end

end
