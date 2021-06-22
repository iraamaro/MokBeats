require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid if the email and password are empty" do
    expect(User.create(email: '', password: '')).to_not be_valid
  end
  it "is valid if the email and password are filled" do
    expect(User.create(email: 'test@mokbeats.com', password: '123456')).to be_valid
  end
end
