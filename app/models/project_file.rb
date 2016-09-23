# == Schema Information
#
# Table name: project_files
#
#  id          :integer          not null, primary key
#  file        :string(255)
#  description :string(255)
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  url         :string(255)
#

class ProjectFile < ActiveRecord::Base
  
  belongs_to :project
  
  mount_uploader :file, ProjectFileUploader
  
  acts_as_url :file, limit: 100
  
  def to_param
    url
  end
  
end