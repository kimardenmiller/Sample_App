# app/models/user.rb
class User < ParseUser
  # you can add fields, like any other kind of Object...
  fields :name, :bio

  # but note that email is a special field in the Parse API.
  fields :email

  # no validations included, but feel free to add your own
  #validates_presence_of :username


  before_save { |user| user.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

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
