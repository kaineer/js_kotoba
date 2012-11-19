class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :jabber
  attr_accessible :password, :password_confirmation

  def update_jabber(params)
    update_attributes(
                      :jabber => params[:login],
                      :password => random_password,
                      :password_confirmation => random_password
                      )
  end

  def sign_in_hash
    { :email => email }
  end

  def clean_up_passwords
    self.encrypted_password = nil
  end

  def jabber=(value)
    self.email = value
  end

  def jabber
    email
  end

  def random_password
    @random_password ||= RandomPassword.new.generate
  end
end
