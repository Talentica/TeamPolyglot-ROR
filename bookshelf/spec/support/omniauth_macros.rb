module OmniauthMacros
  def mock_auth_hash_fb
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
        provider: "facebook", uid: "123545",
        info: {
          first_name: "dummy",
          last_name:  "user",
          email:      "test@dummy.com"
        },
        credentials: { token: "123456",
                       expires_at: Time.now + 1.week
        },
        extra: {
          raw_info: {
            gender: "male"
          }
        }
    })
  end

  def mock_auth_hash_google
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        provider: "google_oauth2", uid: "123545678",
        info: {
          first_name: "dummy_google",
          last_name:  "user_google",
          email:      "test_google@dummy.com"
        },
        credentials: { token: "12345678",
                       expires_at: Time.now + 2.week
        },
        extra: {
          raw_info: {
            gender: "female"
          }
        }
  })
  end
end
