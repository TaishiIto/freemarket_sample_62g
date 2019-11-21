require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    it "すべてのカラムのデータがある場合データが有効である" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "nameがない場合は無効である" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "priceがない場合無効である" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "priceが300未満の場合無効である" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "priceが9999999より大きい場合無効である" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "conditionが1未満の場合無効である" do
      item = build(:item, condition: 0)
      item.valid?
      expect(item.errors[:condition]).to include("must be greater than or equal to 1")
    end

    it "conditionが6より大きい場合無効である" do
      item = build(:item, condition: 7)
      item.valid?
      expect(item.errors[:condition]).to include("must be less than or equal to 6")
    end

    it "size_idが10より大きい場合無効である" do
      item = build(:item, size_id: 11)
      item.valid?
      expect(item.errors[:size_id]).to include("must be less than or equal to 10")
    end

    it "category_idが1未満の場合無効である" do
      item = build(:item, category_id: 0)
      item.valid?
      expect(item.errors[:category_id]).to include("must be greater than or equal to 1")
    end

    it "category_idが6より大きい場合無効である" do
      item = build(:item, category_id: 14)
      item.valid?
      expect(item.errors[:category_id]).to include("must be less than or equal to 13")
    end
  end
end
