class Post < ApplicationRecord
  def generate_slug
  self.slug = SecureRandom.hex(12)
  self.save
end

end
