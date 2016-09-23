# == Schema Information
#
# Table name: clients
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  addressable_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  hourly_rate    :decimal(10, 2)   default(0.0)
#  url            :string(255)
#

class Client < ActiveRecord::Base

  include Addressable

  has_many :projects, :dependent => :nullify
  has_many :contacts, :dependent => :destroy
  
  validates :name, :presence => true, uniqueness: true
  validates :hourly_rate, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  
  scope :sorted, order("lower(clients.name) asc")
  default_scope order("lower(clients.name) asc")
  
  acts_as_url :name, limit: 100
  
  def display_name
    name
  end
  
  def to_param
    url
  end
  
end
