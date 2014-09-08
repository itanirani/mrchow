class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user
	validate :availability

	private

	def availability
		unless restaurant.available?(group_size, start)
			errors.add(:base, "Restaurant is full! Go somewhere else!")
		end
	end
end
