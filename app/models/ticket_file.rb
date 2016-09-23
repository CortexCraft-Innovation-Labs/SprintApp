class TicketFile < ActiveRecord::Base
  belongs_to :ticket

  mount_uploader :file, TicketFileUploader

  acts_as_url :file, limit: 100

  def to_param
    url
  end
end
