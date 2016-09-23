# == Schema Information
#
# Table name: ticket_statuses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  active     :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

class TicketStatus < ActiveRecord::Base
  
  has_many :tickets, foreign_key: :status_id
  
  validates :name, :presence => true, uniqueness: true
  
  default_scope order("lower(name) asc")
  
  scope :active, -> { where active: true }
  scope :closed, -> { where active: false }
  
end
