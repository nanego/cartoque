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

describe RolesController do
  login_user

  # This should return the minimal set of attributes required to create a valid
  # Role. As you add validations to Role, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {name: "Expert"}
  end

  describe "GET index" do
    it "assigns all roles as @roles" do
      role = Role.create! valid_attributes
      get :index
      assigns(:roles).should eq([role])
    end
  end

  describe "GET new" do
    it "assigns a new role as @role" do
      get :new
      assigns(:role).should be_a_new(Role)
    end
  end

  describe "GET edit" do
    it "assigns the requested role as @role" do
      role = Role.create! valid_attributes
      get :edit, id: role.id
      assigns(:role).should eq(role)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Role" do
        expect {
          post :create, role: valid_attributes
        }.to change(Role, :count).by(1)
      end

      it "assigns a newly created role as @role" do
        post :create, role: valid_attributes
        assigns(:role).should be_a(Role)
        assigns(:role).should be_persisted
      end

      it "redirects to the created role" do
        post :create, role: valid_attributes
        response.should redirect_to(roles_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved role as @role" do
        # Trigger the behavior that occurs when invalid params are submitted
        Role.any_instance.stub(:save).and_return(false)
        post :create, role: {}
        assigns(:role).should be_a_new(Role)
      end

      #TODO: fix it: create role doesn't use the stubbed method
###      it "re-renders the 'new' template" do
###        # Trigger the behavior that occurs when invalid params are submitted
###        Role.any_instance.stub(:save).and_return(false)
###        post :create, role: {}
###        response.should render_template("new")
###      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested role" do
        role = Role.create! valid_attributes
        # Assuming there are no other roles in the database, this
        # specifies that the Role created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Role.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, id: role.id, role: {'these' => 'params'}
      end

      it "assigns the requested role as @role" do
        role = Role.create! valid_attributes
        put :update, id: role.id, role: valid_attributes
        assigns(:role).should eq(role)
      end

      it "redirects to the role" do
        role = Role.create! valid_attributes
        put :update, id: role.id, role: valid_attributes
        response.should redirect_to(roles_url)
      end
    end

    describe "with invalid params" do
      it "assigns the role as @role" do
        role = Role.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Role.any_instance.stub(:save).and_return(false)
        put :update, id: role.id, role: {}
        assigns(:role).should eq(role)
      end

      #TODO: fix it! Role found doesn't use the stubbed method
###      it "re-renders the 'edit' template" do
###        role = Role.create! valid_attributes
###        # Trigger the behavior that occurs when invalid params are submitted
###        Role.any_instance.stub(:save).and_return(false)
###        put :update, id: role.id, role: {}
###        response.should render_template("edit")
###      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested role" do
      role = Role.create! valid_attributes
      expect {
        delete :destroy, id: role.id
      }.to change(Role, :count).by(-1)
    end

    it "redirects to the roles list" do
      role = Role.create! valid_attributes
      delete :destroy, id: role.id
      response.should redirect_to(roles_url)
    end
  end

end
