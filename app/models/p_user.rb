class PUser < ParseResource::Base
  #attr_accessible :name, :email, :password, :password_confirmation
  #fields :name, :email
  field :name
  field :email
  field :password_digest

  before_save { |user| user.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  #
  #validates :password, presence: true, length: { minimum: 6 }
  #validates :password_confirmation, presence: true

  #validates :email, uniqueness: { case_sensitive: false }
  #validates :email, UniquenessValidator: true
  #validates_uniqueness_of :email
  #validates_presence_of :name

end

