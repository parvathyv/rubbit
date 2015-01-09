require 'rails_helper'

describe Article do

  it { should belong_to :user }

  it { should have_many(:reviews).dependent(:destroy) }

  describe "#name" do
    it { should have_valid(:name).when("DamianGrammaticus", "Mislengthy_Pressage", "12345") }
    it { should_not have_valid(:name).when("abc", nil, "jdkfjdkfjdkfjdkfjdkfjdkfjdkfjdkfjdkfdjfkdjfkdjfkdfjkdjfkd") }
  end

  describe "#url" do
    subject { FactoryGirl.create(:article) }
    it { should have_valid(:url).when("http://webpage.com", "https://anotherwebpage.com") }
    it { should_not have_valid(:url).when("abc", nil, "www.web.com") }
    it { should validate_uniqueness_of(:url) }
  end

  describe "#description" do

    text = ""
      501.times do
    text << "a"
    end

    it { should have_valid(:description).when("a description", "something here") }
    it { should_not have_valid(:description).when("#{text}") }
  end
  
end
