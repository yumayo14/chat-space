require 'rails_helper'
describe 'メッセージの投稿' do
  describe Message do
    describe '#create' do
      it "メッセージと画像がある場合は保存できる" do
        message = build(:message)
        expect(message).to be_valid
      end
      it "メッセージがある場合は保存できる" do
        message = build(:message, image: "")
        expect(message).to be_valid
      end
      it "画像がある場合は保存できる" do
        message = build(:message, text: "")
        expect(message).to be_valid
      end
      it "メッセージも画像も無いと保存できない" do
        message= build(:message, text: "", image: "")
        message.valid?
        expect(message.errors[:text_or_image]).to include "を入力してください"
      end
      it "group_idが空だと保存されない" do
        message = build(:message, group_id: "")
        message.valid?
        expect(message.errors[:group]).to include "を入力してください"
      end
      it "user_idが空だと保存されない" do
        message = build(:message, user_id: "")
        message.valid?
        expect(message.errors[:user]).to include "を入力してください"
      end
    end
  end
end
