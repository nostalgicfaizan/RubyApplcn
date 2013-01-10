class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  

  # Setup accessible (or protected) attributes for your model
  
    attr_accessible :name, :attach, :pic
    has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    has_attached_file :attach 
    
    #validates :email, :presence => true

	  validates :name, :presence => true
    validates_attachment_presence :pic
    validates_attachment_size :pic, :less_than => 5.megabytes
    validates_attachment_content_type :pic, :content_type => [ 'image/jpeg', 'image/png']
    
      
    
    #validates :attach_file_name, :presence => true
     #validates :pic_file_name, :presence => true
    
    validate :pic_file_name_cannot_be_blank 

    def pic_file_name_cannot_be_blank
     
      if attach_file_name.blank? and  pic_file_name.blank?
        errors.add(:pic_file_name,  "cannot be blank")
      end
    end
end