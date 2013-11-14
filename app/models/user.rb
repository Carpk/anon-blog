class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts
  validates :user, :email, presence: true, uniqueness: true
  validates :password, presence: true
  # validates :email, format: {with: /^\S+@\S+\.\S+$/, message: "Invalid E-mail"}
  # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_secure_password
end