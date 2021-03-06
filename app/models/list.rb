class List < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user
  validates_presence_of :name
  
  has_many :items
end
