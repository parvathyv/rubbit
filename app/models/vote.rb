class Vote < ActiveRecord::Base

  belongs_to :article
  belongs_to :user

validates_uniqueness_of :user_id, scope: [:article_id, :vote_tally]
end
