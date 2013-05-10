class User < ActiveRecord::Base
  acts_as_authentic do |config|
    config.login_field = :email_address
    config.require_password_confirmation = false
    config.ignore_blank_passwords = true
  end
  
  has_many :items, :order => "sort_order asc"
  has_many :open_items, :class_name => 'Item', :conditions => {:completed => false}, :order => "sort_order asc"

  validates :email_address, :presence => true, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
end