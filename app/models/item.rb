class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
  
  validates :title, :presence => true
  
  def pretty_due_date
    self.due_date.blank? ? "" : "#{self.due_date.strftime("%B %d, %Y")}"
  end
end
