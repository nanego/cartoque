require 'spec_helper'

describe LicensesController do
  login_user

  before do
    @license = License.create(editor: "WorldSoft")
  end

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:licenses)
  end

  it "creates license" do
    lambda{ post :create, license: { editor: "WorldSoft", key: "123456" } }.should change(License, :count)
    assert_redirected_to licenses_path
  end

  it "gets edit" do
    get :edit, id: @license.to_param
    assert_response :success
  end

  it "updates license" do
    put :update, id: @license.to_param, license: @license.attributes
    assert_redirected_to licenses_path
  end

  it "destroys license" do
    lambda{ delete :destroy, id: @license.to_param }.should change(License, :count).by(-1)
    assert_redirected_to licenses_path
  end
end
