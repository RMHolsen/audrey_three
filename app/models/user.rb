class User < ActiveRecord::Base 
    #validates :username, :email, presence: true 
    #validates :username, :email, uniqueness: true 
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    has_secure_password
    has_many :projects 
    has_many :lists, through: :projects 

    #def self.find_or_create_by_omniauth(auth_hash)
    #NEW HOTNESS
        #self.where(email: auth_hash["info"]["email"]).first_or_create do |user|
            #user.password = SecureRandom.hex
        #end

    #OLD AND BUSTED
    #oauth_email = auth_hash["info"]["email"]
        #if user = User.find_by(email: oauth_email)
            #user 
        #else 
            #user = User.create(email: oauth_email, password: SecureRandom.hex)
        #end
         
    #end 
end 