module OmniAuthFixtures
  def self.linkedin_mock
    {provider: 'linkedin',
      uid: "6JtUMFXHvO",
      info:
       {name: 'John Doe',
        email: 'johndoe@gmail.se',
        nickname: 'John Doe',
        first_name: 'John',
        last_name: 'Doe',
        location: {country: {code: 'se'}, name: 'Kungalv, Sweden'},
        description: '--',
        image: nil,
        urls: {public_profile: 'http://www.linkedin.com/in/john-doe-a7b6a5173'}},
      credentials:
       {token: 'AQVAJdcPS3zp2ukVaEyeCu0MsytHzACFJHcBi7D5',
        expires_at: 1545468081,
        expires: true},
      extra:
       {raw_info:
         {emailAddress: 'jogndoe@gmail.se',
          firstName: 'John',
          headline: '--',
          id: '6JrUMFXHv4',
          lastName: 'Doe',
          location: {country: {code: 'se'}, name: 'Kungalv, Sweden'},
          publicProfileUrl: 'http://www.linkedin.com/in/john-doe-a7b6a5173'}
        }
      }
  end
end