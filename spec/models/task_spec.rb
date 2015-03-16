require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "should require name" do
    it "should be invalid without a name" do
      expect(FactoryGirl.build(:task, name: nil)).to be_invalid
    end
  end

  describe "should have an associated user" do
    it "should be invalid without a user_id" do
      expect(FactoryGirl.build(:task, user_id: nil)).to be_invalid
    end
  end

  describe "should save when valid" do
    it "should be valid" do
      expect(FactoryGirl.build(:task)).to be_valid
    end
  end  
end
