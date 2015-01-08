class Review < ActiveRecord::Base
belongs_to :article
belongs_to :user

validates :body, length: { minimum: 25 }, presence: true
validates :article, :user, presence: true

def self.search(search)
  if search
    where("name like ?", "%#{search}%")
  else
    all
  end
end

end
