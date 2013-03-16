class Light < ActiveRecord::Base
  attr_accessible :message, :topic

  belongs_to :user
end
