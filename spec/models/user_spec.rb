require 'rails_helper'
describe User do
  describe '#create' do
    it "is created with name, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "is invalid if name.length = 7" do
      user = build(:user, name: "yamadaY")
      user.valid?
      expect(user.errors[:name]).to include("は6文字以内で入力してください")
    end

    it "is valid if name.length = 6" do
      user = build(:user, name: "yamada")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid if not email unique" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is invalid if email.length = 5" do
      user = build(:user, email: "ya@co")
      user.valid?
      expect(user.errors[:email]).to include("は6文字以上で入力してください")
    end

    it "is valid if email.length = 6" do
      user = build(:user, email: "yam@co")
      user.valid?
      expect(user).to be_valid
    end

    # it "is invalid if password != password_confirmation" do
    #   user = build(:user, password_confirmation: "11111111")
    #   user.valid?
    # end
  end
end