class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true 
  has_secure_password

  def is_admin?
    self.admin == true
  end

  def can_login?
    self.can_login == true
  end
end
