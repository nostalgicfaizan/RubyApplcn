
require 'spec_helper'

describe "User model" do
    describe "with valid params" do
      it 'takes name,picture and attachment for uploading files #valid when proper arguments are passed' do
      User.new(:name =>"gabriel", :pic=>File.new(Rails.root + 'spec/fixtures/images/zoombiee.jpg'), :attach=>File.new(Rails.root + 'spec/fixtures/attachments/oops.txt')).should be_valid
      end
     it 'could Upload without text attachment' do
     User.new(:attach=>nil, :name=>"jamieee", :pic=>File.open(Rails.root + 'spec/fixtures/images/zoombiee.jpg')).should be_valid
    end

    it 'could upload with name and either picture or text file' do
   user = User.new(:name=>"gabriel", :attach=>nil, :pic=>File.new(Rails.root + 'spec/fixtures/images/zoombiee.jpg'))
    (user.attach.should_not be_nil) && (user.pic.should_not be_nil)
    end
end

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
                allowing('image/jpg', 'image/png' ).
                rejecting('text/plain', 'text/xml') }

      it { should validate_attachment_size(:pic).
                less_than(5.megabytes) }
              end
end