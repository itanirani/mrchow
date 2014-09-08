class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, through: :reservations

	def available?(group_size, start_time)
		group_size <= occupancy
	end
end
