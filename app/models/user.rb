class User < ApplicationRecord
	has_one :device

	validates :name, presence: true
	validates :mobile, presence: true, uniqueness: true,  length: { minimum: 10}


end
