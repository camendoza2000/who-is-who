class User < ActiveRecord::Base
	has_many :interests
  validates :name, presence: true
  has_attached_file :avatar, 
                    :styles => { :medium => "500x500>", :thumb => "125x125>" },
                    :default_url => "thumb/missing.png"
  
  validates_attachment_content_type :avatar, 
                                    :content_type => /\Aimage\/.*\Z/

  validates_attachment_presence :avatar
end
