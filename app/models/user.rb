class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  

  # Setup accessible (or protected) attributes for your model
  
  attr_accessible :email, :name, :attach, :pic
  
 #    validates :email, :presence => true
	 validates :name, :presence => true
     has_attached_file :pic
       # { :medium => "300x300>", :thumb => "100x100>" }
     has_attached_file :attach
end
