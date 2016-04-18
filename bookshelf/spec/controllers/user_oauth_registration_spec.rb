describe Users::OmniauthCallbacksController do
  before(:each) do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end
  describe "#when user is annonymous"
  let(:created_user) { User.find_by_email(request.env["omniauth.auth"].info["email"]) }
  let(:user_has_authentication) { created_user.authentications }
  let(:suppose_to_created) { request.env["omniauth.auth"].info["email"] }

  it "should create a user via facebook account" do
    request.env["omniauth.auth"] = mock_auth_hash_fb
    get :facebook
    expect(user_has_authentication.where("authentication_provider_id=1"))
      .to_not be_nil
    expect(created_user.email).to eq(suppose_to_created)
  end

  it "should create a user via google account" do
    request.env["omniauth.auth"] = mock_auth_hash_google
    get :google_oauth2
    expect(user_has_authentication.where("authentication_provider_id=2"))
      .should_not be_nil
    expect(created_user.email).to eq(suppose_to_created)
  end
end
