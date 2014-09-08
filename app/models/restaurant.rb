class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :reviews
	has_many :users, through: :reservations
#maybe has many :users, through: reviews
	def available?(group_size, start_time)
		group_size <= occupancy
	end
end
