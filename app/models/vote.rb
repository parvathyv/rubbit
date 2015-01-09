class Vote < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates_uniqueness_of :user, scope: [:article, :vote_tally]
end
