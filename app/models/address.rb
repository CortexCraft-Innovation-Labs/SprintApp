# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  addressable_id   :integer
#  addressable_type :string(255)
#  street           :string(255)
#  city             :string(255)
#  state            :string(2)
#  zip              :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  
  validates :state, :inclusion => { :in => States::all.keys }, :allow_blank => true
  validates :zip, :numericality => { :only_integer => true, :greater_than => 0 }, :allow_blank => true

  def to_s
    "%s, %s,%s %s" % [street,city,state,zip]
  end
  
end
