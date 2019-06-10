require 'rails_helper'
describe Message do
  describe '#create' do
    it "is created with text and image" do
      message = build(:message)
      message.valid?
      expect(message).to be_valid
    end

    it "is created with text" do
      message = build(:message, image: nil)
      message.valid?
      expect(message).to be_valid
    end

    it "is created with image" do
      message = build(:message, text: nil)
      message.valid?
      expect(message).to be_valid
    end

    it "is not created without text and image" do
      message = build(:message, text: nil, image: nil)
      message.valid?
      expect(message.errors[:text]).to include("を入力してください")
    end

    it "is not created without user" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user]).to include("を入力してください")
    end

    it "is not created without group" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group]).to include("を入力してください")
    end
  end
end
