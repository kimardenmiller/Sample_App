#class User < ParseResource::Base
#  field :name
#  field :email
#
#end


class User < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name, presence: true
  #validates :email, UniquenessValidator: true

end
