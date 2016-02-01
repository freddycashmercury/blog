class User < ActiveRecord::Base
  attr_accessor :username, :email 
  has_secure_password
end
