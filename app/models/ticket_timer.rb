# == Schema Information
#
# Table name: ticket_timers
#
#  id            :integer          not null, primary key
#  admin_user_id :integer
#  ticket_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TicketTimer < ActiveRecord::Base
  
  belongs_to :admin_user
  belongs_to :ticket
  has_one :project, through: :ticket
  
  scope :created_by, ->(u) { where admin_user_id: u.id }
  
  def elapsed_time
    Time.zone.now - created_at.to_time
  end
  
  def readable_elapsed
    Time.at(elapsed_time).utc.strftime "%H:%M" rescue nil
  end
  
end
