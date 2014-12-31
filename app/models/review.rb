class Review < ActiveRecord::Base
belongs_to :article
belongs_to :user

validates :body, length: { minimum: 50 }, presence: true
end
