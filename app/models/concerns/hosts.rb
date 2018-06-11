class Host < ApplicationRecord
	include Clearance::Host

	has_one :role
 has_many :authentications, dependent: :destroy

 def self.create_with_auth_and_hash(authentication, auth_hash)
  host = self.create!(
     # name: auth_hash["info"]["name"],
     email: auth_hash["info"]["email"],
     password: SecureRandom.hex(10)

   )
   host.authentications << authentication
   return host
 end

 # grab google to access google for host data
 def google_token
   x = self.authentications.find_by(provider: 'google_oauth2')
   return x.token unless x.nil?
 end
end