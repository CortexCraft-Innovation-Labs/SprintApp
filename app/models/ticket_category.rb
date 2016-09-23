# == Schema Information
#
# Table name: ticket_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TicketCategory < ActiveRecord::Base
  
  has_many :tickets, :dependent => :nullify
  
  default_scope order("lower(name) asc")
  
  validates :name, :presence => true, uniqueness: true
  
  def display_name
    name
  end
  
end
