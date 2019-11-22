require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    # name
    it "nameがない場合無効である" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "21文字以上の場合は無効である" do
      user = build(:user, name:("a" * 21))
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 20 characters)")
    end

    #email
    it "emailがない場合無効である" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "emailがxxxxxx@xxx.xxx以外の場合無効である" do
      user = build(:user, email:"aaaa.jjkl@gh")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "emailが同じ場合は無効である" do
      create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    
    # first_name_kanji
    it "first_name_kanjiがない場合無効である" do
      user = build(:user, first_name_kanji: nil)
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("can't be blank")
    end

    it "first_name_kanjiが21文字以上の場合は無効である" do
      user = build(:user, first_name_kanji: ("a" * 21))
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("is too long (maximum is 20 characters)")
    end

    it "first_name_kanjiが漢字以外の場合無効である" do
      user = build(:user, first_name_kanji:"あ")
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("is invalid")
    end

    # family_name_kanji
    it "family_name_kanjiがない場合無効である" do
      user = build(:user, family_name_kanji: nil)
      user.valid?
      expect(user.errors[:family_name_kanji]).to include("can't be blank")
    end

    it "family_name_kanjiが21文字以上の場合は無効である" do
      user = build(:user, family_name_kanji: ("a" * 21))
      user.valid?
      expect(user.errors[:family_name_kanji]).to include("is too long (maximum is 20 characters)")
    end

    it "family_name_kanjiが漢字以外の場合無効である" do
      user = build(:user, family_name_kanji:"あ")
      user.valid?
      expect(user.errors[:family_name_kanji]).to include("is invalid")
    end

    # first_name_kana
    it "first_name_kanaがない場合無効である" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaが21文字以上の場合は無効である" do
      user = build(:user, first_name_kana: ("a" * 21))
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is too long (maximum is 20 characters)")
    end

    it "first_name_kanaがカタカナ以外の場合無効である" do
      user = build(:user, first_name_kana:"あ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end

    # family_name_kana
    it "family_name_kanaがない場合無効である" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    it "family_name_kanaが21文字以上の場合は無効である" do
      user = build(:user, family_name_kana: ("a" * 21))
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is too long (maximum is 20 characters)")
    end

    it "family_name_kanaがカタカナ以外の場合無効である" do
      user = build(:user, family_name_kana:"あ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end

    # birthday
    it "birthdayがない場合無効である" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    # phone_number
    it "phone_numberがない場合無効である" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end

    # password
    it "passwordがない場合無効である" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが6桁以下の場合は無効である" do
      user = build(:user, password: ("a" * 6))
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end

    it "passwordが129桁以上の場合は無効である" do
      user = build(:user, password: ("a" * 129))
      user.valid?
      expect(user.errors[:password]).to include("is too long (maximum is 128 characters)")
    end

  end
end


