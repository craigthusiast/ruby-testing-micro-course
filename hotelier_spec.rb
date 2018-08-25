require 'rspec'

class Hotel
  attr_accessor :guests, :rooms_occupied

  def initialize
    @guests = []
    @rooms_occupied = []
  end

  def check_in_guest(guest_name, room_number)
    @guests << guest_name
    @rooms_occupied << room_number
  end

  def check_out_guest(guest_name)
    @guests.delete(guest_name)
  end

end

describe Hotel do
  it 'can check in a guest' do
    hotel = Hotel.new
    hotel.check_in_guest("Craig DesBrisay", 212)
    expect(hotel.guests).to include 'Craig DesBrisay'
  end

  it 'can check a guest out' do
    hotel = Hotel.new
    hotel.check_in_guest("Craig DesBrisay", 212)
    hotel.check_in_guest("Christie Longhurst", 213)
    hotel.check_out_guest("Craig DesBrisay")
    expect(hotel.guests).not_to include 'Craig DesBrisay'
    expect(hotel.rooms_occupied).to include 212
    $stderr.puts hotel.guests
    $stderr.puts hotel.rooms_occupied
  end
end
