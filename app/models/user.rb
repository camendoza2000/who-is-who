class User < ActiveRecord::Base
  validates :name, presence: true
  has_attached_file :avatar, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/app/assets/images/:style/missing.png"
  
  validates_attachment_content_type :avatar, 
                                    :content_type => /\Aimage\/.*\Z/

  validates_attachment_presence :avatar
end
