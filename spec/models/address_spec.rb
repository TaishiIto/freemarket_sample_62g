require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '#create' do
    # zip_code
    it "zip_codeがない場合無効である" do
      address = build(:address, zip_code: nil)
      address.valid?
      expect(address.errors[:zip_code]).to include("can't be blank")
    end

    # city
    it "cityがない場合無効である" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    # house_number
    it "house_numberがない場合無効である" do
      address = build(:address, house_number: nil)
      address.valid?
      expect(address.errors[:house_number]).to include("can't be blank")
    end

    # prefecture_id
    it "prefecture_idがない場合無効である" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("can't be blank")
    end

    it "prefecture_idが0の場合無効である" do
      address = build(:address, prefecture_id: 0)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("must be greater than or equal to 1")
    end

    it "prefecture_idが48以上の場合無効である" do
      address = build(:address, prefecture_id: 48)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("must be less than or equal to 47")
    end

    # user_id
    it "user_idがない場合無効である" do
      address = build(:address, user_id: nil)
      address.valid?
      expect(address.errors[:user_id]).to include("can't be blank")
    end

  end
end
