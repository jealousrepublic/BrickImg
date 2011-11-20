class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :active_state, :activation_key
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username, :on => :create
  validates_presence_of :email, :on => :create
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt) && user.active_state == 1
      user
    else
      nil
    end
  end
  
  def self.generate_password(length=10)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789!@$^&*_+'
    password = ''
    length.times { |i| password << chars[rand(chars.length)] }
    password
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
end
