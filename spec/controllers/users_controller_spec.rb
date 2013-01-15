  #require File.expand_path('../../spec_helper', __FILE__)
   require  'spec_helper'

  describe UsersController do 
      include Devise::TestHelpers

      before (:each) do

      @member = Member.create!({

        :email => 'faizan123@gmail.com',

        :password => '1234567',

        :password_confirmation => '1234567',

        :administrator => true
   })
      sign_in @member

  end

      def valid_attributes
     	  { 
          :name => "MyString", 
          :attach => File.new(Rails.root + 'spec/fixtures/attachments/oops.txt'), 
          :pic =>File.new(Rails.root + 'spec/fixtures/images/zoombiee.jpg')
        }
      end
      
      def valid_session
      {}
      end

    describe "GET #index" do
      it "assigns all users as @users" do
      	user = User.create! valid_attributes
      	#to invoke the actions before assigning the values
      	get :index
      	assigns(:users).should eq([user])
      end
        it "renders the index template" do
        get :index
        response.should render_template("index")
      end
    end



     describe "GET #show" do
         it "assigns the requested user profile as @user" do
         user = User.create! valid_attributes
         get :show, {:id => user.to_param}#, valid_session
         assigns(:user).should eq(user)
      end
    end
       describe "GET #new" do
       it "assigns a new user as @user" do
        
        get :new, {}#, valid_session
        assigns(:user).should be_a_new(User)
      end
    end
      describe "GET #edit" do
      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        get :edit, {:id => user.to_param}#, valid_session
        assigns(:user).should eq(user)
      end
    end
    describe "POST #create" do
      describe "with valid params" do
        it "creates a new User profile" do
          expect {
            post :create, {:user => valid_attributes}#, valid_session
          }.to change(User, :count).by(1)
        end
      end
        it "assigns a newly created user as @user" do
           post :create, { :user => valid_attributes}#, valid_session
           assigns(:user).should be_a(@user)
           assigns(:user).should be_persisted
       end
          it "redirects to the created user" do
          post :create, {:user => valid_attributes}#,valid_session 
          response.should redirect_to(@user) 
         end

         describe "with invalid params" do
           it "assigns a newly created but unsaved user as @user" do
           # Trigger the behavior that occurs when invalid params are submitted
           User.any_instance.stub(:save).and_return(false)
           post :create, {:user => { "name" => "invalid value" }}#, valid_session
           assigns(:user).should be_a_new(User)
         end

         #validating render action
         it "re-renders the 'new' template" do
           # Trigger the behavior that occurs when invalid params are submitted
           User.any_instance.stub(:save).and_return(false)
           post :create, {:user => { "name" => "invalid value" }}#, valid_session
           response.should render_template("new")
         end
       end
    end

      describe "DELETE destroy" do
      it "destroys the requested user along with its complete profile" do
        user = User.create! valid_attributes
        expect {
          delete :destroy, {:id => user.to_param}#, valid_session
        }.to change(User, :count).by(-1)
      end

      it "redirects to the users list" do
        user = User.create! valid_attributes
        delete :destroy, {:id => user.to_param}#, valid_session
        response.should redirect_to(User_url)
      end
    end
  end