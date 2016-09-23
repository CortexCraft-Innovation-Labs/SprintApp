# == Schema Information
#
# Table name: ticket_priorities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  weight     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TicketPriority < ActiveRecord::Base
  
  WEIGHTS = %w(low normal high immediate).freeze
  
  has_many :tickets
  
  default_scope order("lower(name) asc")
  
  validates :name, presence: true, uniqueness: true
  validates :weight, presence: true, inclusion: { in: WEIGHTS }
  
end
