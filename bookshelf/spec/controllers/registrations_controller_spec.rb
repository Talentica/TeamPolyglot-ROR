require "spec_helper"
describe RegistrationsController do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_out :user
  end
  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  it "check user email availability during signup" do
    expected = false
    @user = FactoryGirl.attributes_for(:user)
    post :create, user: @user
    post :check_email_availabilty, email: @user[:email], format: :json
    result = JSON.parse(response.body)
    expect(result["available"]).to eq(expected)
  end
end
