class Article < ActiveRecord::Base

has_many :reviews, dependent: :destroy
has_many :votes, dependent: :destroy

belongs_to :user
belongs_to :category

validates :name, presence: true
validates :name, length: {
  minimum: 5,
  maximum: 50
}

validates :url, presence: true
validates :url, :format => URI::regexp(%w(http https))
validates :url, uniqueness: true

validates :description, presence: true
validates :description, length: { maximum: 500 }

def self.search(search)
  if search
    find(:all, :conditions => ["name ILIKE ?", "%#{search}%"])
  else
    all
  end
end

end
