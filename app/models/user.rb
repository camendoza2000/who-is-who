class User < ActiveRecord::Base
  validates :name, presence: true
  validates :emails, presence: true,
                     format: { with: /\A[^@]+@[^@]+\z/,
                               message: "Please ingrese a valid email"}
  validates :birthplace, presence: true

  #validate :birthday_not_set, on: :create

  validates :institution, presence: true
  validates :career, presence: true
  validates :responsibilities, presence: true
 
  has_attached_file :avatar, 
                    :styles => { :medium => "500x500>", :thumb => "125x125>" },
                    :default_url => "thumb/missing.png"
  
  validates_attachment_content_type :avatar, 
                                    :content_type => /\Aimage\/.*\Z/

  validates_attachment_presence :avatar 

  has_many :interests

  #def birthday_not_set
  #  if   == Date.current.year.to_s
  #    errors.add()
  #    
  #  end
  #end

end
