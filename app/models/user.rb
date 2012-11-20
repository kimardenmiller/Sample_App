# app/models/user.rb
class User < ParseUser

  # Note no " < ActiveRecord::Base"

  #attr_accessible :username, :name, :email, :password, :password_confirmation
  #attr_accessible :username, :email, :password, :password_confirmation

  attr_accessor :username, :name, :password, :password_confirmation
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username

  #  *** Does not seem to with with ParseUser ***
  #validates_uniqueness_of :email

  # you can add fields, like any other kind of Object...
  fields :name, :bio, :username

  # but note that email is a special field in the Parse API.
  fields :email, :remember_token

  # no validations included, but feel free to add your own
  #validates_presence_of :username

  before_save { |user| user.username = username.downcase }


  before_save :create_remember_token

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end



  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, format: { with: VALID_EMAIL_REGEX }


end


#class User < ParseResource::Base
#  field :name
#  field :email
#
#end


#class User < ActiveRecord::Base
#  attr_accessible :email, :name
#
#  validates :name, presence: true
#  #validates :email, UniquenessValidator: true
#
#end
