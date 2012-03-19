require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AccountsController do

  before(:each) do
    sign_in(@user = Factory(:user))
  end

  # This is a partial list of attributes since we're only dealing with updates
  def valid_attributes
    {:first_name => "Joe", :last_name => "Smith"}
  end

  describe "GET edit" do
    it "assigns the current user as @user" do
      get :edit
      assigns(:user).should eq(@user)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the current user" do
        # Assuming there are no other users in the database, this
        # specifies that the User created by the factory
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        User.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :user => {'these' => 'params'}
      end

      it "assigns the current user as @user" do
        put :update, :user => valid_attributes
        assigns(:user).should eq(@user)
      end

      it "redirects to root" do
        put :update, :user => valid_attributes
        response.should redirect_to(contents_path(:action => 'home'))
      end
    end

    describe "with invalid params" do
      it "assigns the current as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, :user => {}
        assigns(:user).should eq(@user)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, :user => {}
        response.should render_template("edit")
      end
    end
  end
end
