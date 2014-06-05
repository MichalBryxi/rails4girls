class User < ActiveRecord::Base
  validates :first_name, length: { in: 3..15 }
  validates :last_name, length: { minimum: 3 }
  validates :age, :inclusion => 13..99
  validates :email, uniqueness: true
end
