require 'spec_helper'

describe TicketType do
  it { should have_many :tickets }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  describe '#display_name' do
    subject(:type) { build(:ticket_type) }
    its(:display_name) { should == category.name }
  end
end
