class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  

  # Setup accessible (or protected) attributes for your model
  
    attr_accessible :name, :attach, :pic
  
    # validates :email, :presence => true
	  validates :name, :presence => true 
    # validate :check_image_dimension
     has_attached_file :pic
     # :styles =>
      # { :medium => "300x300>", :thumb => "100x100>" }
     has_attached_file :attach

     #validates_attachment :pic, :presence => true
	   #content_type => { :content_type => "image/jpg" } 
 end