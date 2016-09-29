require "lib.rb"

class Device < ApplicationRecord
  belongs_to :user

	validates :token, uniqueness: true, presence: true, length: { minimum: 20}

	def self.build user
		token = generate_token
		device = Device.create user: user, token: token
		token if device.save
	end

end
