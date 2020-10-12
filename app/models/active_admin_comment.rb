class ActiveAdminComment < ApplicationRecord

  def author_name
    username = ""
    if self.author_type == "User"
      username = User.find_by(id: self.author_id)&.name
    end
    username
  end
end
