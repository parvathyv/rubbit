require 'rails_helper'

describe Review do

it { should belong_to :user }

  describe "#body" do
    it { should have_valid(:body).when("Review of around 25 words or so", "Another review of around that length") }
    it { should_not have_valid(:body).when("abc", nil, "Too short") }
  end

end
