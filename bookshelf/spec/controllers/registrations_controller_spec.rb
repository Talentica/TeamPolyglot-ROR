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
end
