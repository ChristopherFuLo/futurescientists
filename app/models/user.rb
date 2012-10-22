class User < ActiveRecord::Base
attr_accessible :location, :name, :phone_number

 has_many :problems
 has_one :account

  validates :name, :presence => true
  validates :phone_number, :presence => true

end