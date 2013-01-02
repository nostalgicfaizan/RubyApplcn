class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  

  # Setup accessible (or protected) attributes for your model
  
    attr_accessible :name, :attach, :pic
    #validates :email, :presence => true

	  validates :name, :presence => true
    has_attached_file :pic 
      
    has_attached_file :attach 
    #validates :attach_file_name, :presence => true
     #validates :pic_file_name, :presence => true
    
    validate :pic_file_name_cannot_be_blank 

    def pic_file_name_cannot_be_blank
     
      if attach_file_name.blank? and  pic_file_name.blank?
        errors.add(:pic_file_name,  "cannot be blank")
        end
      end
end