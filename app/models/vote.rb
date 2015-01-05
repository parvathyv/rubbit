class Vote < ActiveRecord::Base

  belongs_to :article
  belongs_to :user

  def upvote_count
    votes.count(:vote_tally => "value = 1")
  end

  def downvote_count
    votes.count(:vote_tally => "value = -1")
  end
end
