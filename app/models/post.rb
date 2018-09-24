class Post < ApplicationRecord
  belongs_to :user

  def generate_slug
  self.slug = SecureRandom.hex(12)
  self.save
end

end
