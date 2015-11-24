FactoryGirl.define do
  factory :authentication do
    user
    uid "asdf123"
    provider "github"
  end
end
