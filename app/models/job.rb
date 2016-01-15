class Job < ActiveRecord::Base
  belongs_to :message
  belongs_to :author, class_name: "User"
end
