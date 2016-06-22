class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# Generate Authentication Token during Signup and Login Process
  before_create :ensure_authentication_token!
  before_create :check_password!

  #************* Checking Access Token of User  ************************
  scope :authenticate!, -> (auth_token) {where(id: id,authentication_token: auth_token) }
  
  # This is for Comparing Password and Confirm Password
  def check_password!
    if self.password != password_confirmation
      false
    end 
  end

  def ensure_authentication_token!
      self.authentication_token = generate_authentication_token
  end

  
  private

    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
end
