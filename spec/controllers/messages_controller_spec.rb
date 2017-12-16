require 'rails_helper'
describe MessagesController, type: :controller do
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  describe "Get #index" do

    context "ユーザーがログインしている場合" do
      before do
        login_user user
        get :index, params: { group_id: group.id }
      end
      it "ログインしている場合、indexページに正しく遷移できているかどうか" do
        expect(response).to render_template :index
      end

      it "ユーザーが現在所属しているグループの情報をアクションに渡せているかどうか" do
        groups = user.groups
        expect(assigns(:groups)).to eq groups
      end

      it "ユーザーが所属しているグループのメッセージのみを表示できるかどうか" do
        messages = create_list(:message, 3, group_id: group.id, user_id: user.id)
        expect(assigns(:messages)).to match(messages)
      end
    end


    context "ユーザーがログインしていない場合" do
      it "ログインしていない状態だとログイン画面に遷移できるかどうか" do
        get :index, params: { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "Post #create" do
    before do
      login_user user
    end
    describe "入力された値が有効な場合" do
      it "入力された値が有効な場合データベースに保存できるかどうか" do
        expect{ post :create, params: { group_id: group.id, message: attributes_for(:message) } }.to change(Message, :count).by(1)
      end
      it "メッセージの保存に成功した場合、indexページに遷移されるかどうか" do
        post :create, params: { group_id: group.id, message: attributes_for(:message) }
        expect(response).to redirect_to group_messages_path
      end
    end
    describe "入力された値が無効な場合"
      it "入力された値が無効な場合データベースに保存されないようになっているかどうか" do
        expect{ post :create, params: { group_id: group.id, message: attributes_for(:message, text: "", image: "" ) } }.not_to change(Message, :count)
      end
      it "メッセージの保存に失敗した場合、再びindexページが呼び出されるかどうか" do
        post :create, params: { group_id: group.id, message: attributes_for(:message, text: "", image: "" ) }
        expect(response).to render_template :index
      end
    end
  end
