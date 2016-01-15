class Request < ActiveRecord::Base
  belongs_to :friender, class_name: "User"
  belongs_to :friendee, class_name: "User"

  def accepted?
    self.accepted
  end

end
