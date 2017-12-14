require 'rails_helper'
describe 'メッセージの投稿' do
  describe Message do
    describe '#create' do
      it "メッセージと画像がある場合は保存できる" do
        message = FactoryGirl.build(:message)
        expect(message).to be_valid
      end
      it "メッセージがある場合は保存できる" do
        message = FactoryGirl.build(:message, image: "")
        expect(message).to be_valid
      end
      it "画像がある場合は保存できる" do
        message = FactoryGirl.build(:message, text: "")
        expect(message).to be_valid
      end
      it "メッセージも画像も無いと保存できない" do
        message= FactoryGirl.build(:message, text: "", image: "")
        message.valid?
        expect(message.errors[:text]).to include("can't be blank")
        expect(message.errors[:image]).to include("can't be blank")
      end
      before Group do
        group = FactoryGirl.build(:group, id: "")
      end
      it "group_idが空だと保存されない" do
        message = FactoryGirl.build(:group)
        message.valid?
        expect(message.errors[:group]).to include("can't be blank")
      end
      before User do
        user = FactoryGirl.build(:user, id: "")
      end
      it "group_idが空だと保存されない" do
        message = FactoryGirl.build(:user)
        message.valid?
        expect(message.errors[:user]).to include("can't be blank")
      end
    end
  end
end
