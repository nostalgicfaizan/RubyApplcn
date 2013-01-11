    #attr_accessible :name, :attach, :pic
    #has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    #has_attached_file :attach 
    
    #validates :name, :presence => true
    #validates_attachment_presence :pic
    #validates_attachment_size :pic, :less_than => 5.megabytes
    #validates_attachment_content_type :pic, :content_type => [ 'image/jpeg', 'image/png']
    #validate :pic_file_name_cannot_be_blank 

    #def pic_file_name_cannot_be_blank
     
      #if attach_file_name.blank? and  pic_file_name.blank?
        #errors.add(:pic_file_name,  "cannot be blank")
    #end


require 'spec_helper'

describe "User model" do
    describe "with valid params" do
      it 'takes name,picture and attachment for uploading files #valid when proper arguments are passed' do
      User.new(:name =>"gabriel", :pic=>File.new(Rails.root + 'spec/fixtures/images/zoombiee.jpg'), :attach=>File.new(Rails.root + 'spec/fixtures/attachments/oops.txt')).should be_valid
    end
     it 'could Upload without text attachment' do
     User.new(:attach=>nil, :name=>"jamieee", :pic=>File.new(Rails.root + 'spec/fixtures/images/zoombiee.jpg')).should be_valid
    end
end
    #it 'could upload with name and either picture or text file'
    #User.new(:name=>"gabriel",:attach=>"abc.txt",:pic=>File.new(Rails.root + 'spec/fixtures/images/zoombiee.jpg')).should be_valid
    #end
#end

describe "with invalid params" do
it 'should not be uploaded without name and Pic attachment' do
User.new(:name=>nil, :pic=>nil, :attach=>File.new(Rails.root + 'spec/fixtures/attachments/oops.txt')).should_not be_valid
end
it 'name should not be valid without a string argument' do
user = User.new(:name=>"123", :attach=>"abc.txt", :pic=>File.new(Rails.root + 'spec/fixtures/images/zoombiee.jpg'))
user.name.should be_a(String)
end

it 'picture should not be valid without a .jpg/.png extension' do
user = User.new(:name=>"gabriel", :attach=>nil,:pic=>File.new(Rails.root + 'spec/fixtures/images/zoombiee.jpg'))
user.pic.should_not be_a(String)
end
it 'should be invalid when name is not provided while uploading' do
    user = User.new(:name=>nil, :pic=>File.new(Rails.root + 'spec/fixtures/images/zoombiee.jpg'), :attach=>File.new(Rails.root + 'spec/fixtures/attachments/oops.txt')).should_not be_valid
    end
end


describe User do
  it { should have_attached_file(:pic) }
  it { should validate_attachment_presence(:pic) }
  it { should validate_attachment_content_type(:pic).
                allowing(File.new(Rails.root + 'spec/fixtures/images/zoombiee.jpg'))}
      it { should validate_attachment_size(:pic).
                less_than(5.megabytes)}
end
end