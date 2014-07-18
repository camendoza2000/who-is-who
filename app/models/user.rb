class User < ActiveRecord::Base
	validates :name, presence: true
	#validates :user, save: true
end
