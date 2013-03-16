class User < ActiveRecord::Base
  attr_accessible :interests, :name

  has_many :lights
end
