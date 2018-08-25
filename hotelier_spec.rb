require 'rspec'

class Hotel
  attr_accessor :guests, :rooms_occupied

  def initialize
    @guests = []
    @rooms_occupied = []
  end

  def check_in_guest(guest_name, room_number)
    # if @rooms_occupied.include? room_number
    #   # puts "#{room_number} is already occupied"
    #   return false
    # else
    #   @guests << guest_name
    #   @rooms_occupied << room_number
    #   true
    # end
    return false if @rooms_occupied.include? room_number
    @guests << guest_name
    @rooms_occupied << room_number
    true
  end

  def check_out_guest(guest_name)
    @guests.delete(guest_name)
  end

end

describe Hotel do
  # let(:hotel) { Hotel.new }  use this in each test instead of the repetitive hotel = Hotel.new

  describe 'checking in a guest' do
    it 'checks in the first guest' do
      hotel = Hotel.new
      hotel.check_in_guest("Craig DesBrisay", 212)
      expect(hotel.guests).to include 'Craig DesBrisay'
    end

    context 'room is available' do
      it 'allows check-in' do
        hotel = Hotel.new
        expect(hotel.check_in_guest("Craig DesBrisay", 212)).to be true
      end
    end

    context 'room is not available' do
      it 'prevents duplicate check-in' do
        hotel = Hotel.new
        hotel.check_in_guest("Craig DesBrisay", 212)
        expect(hotel.check_in_guest("Christie Longhurst", 212)).to be false
        $stderr.puts hotel.guests
        $stderr.puts hotel.rooms_occupied
      end
    end

    it 'can check a guest out' do
      hotel = Hotel.new
      hotel.check_in_guest("Craig DesBrisay", 212)
      hotel.check_in_guest("Christie Longhurst", 213)
      hotel.check_out_guest("Craig DesBrisay")
      expect(hotel.guests).not_to include 'Craig DesBrisay'
      $stderr.puts hotel.guests
      $stderr.puts hotel.rooms_occupied
    end
  end
end
