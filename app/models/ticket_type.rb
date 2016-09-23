# == Schema Information
#
# Table name: ticket_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TicketType < ActiveRecord::Base

  has_many :tickets, :dependent => :nullify

  default_scope order("lower(name) asc")

  validates :name, :presence => true, uniqueness: true

  def display_name
    name
  end
end
