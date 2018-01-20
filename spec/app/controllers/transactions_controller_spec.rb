require 'rails_helper'

describe TransactionsController, type: :controller do
  describe 'POST #create' do

    before do
      post :create
    end

    it 'redirects_to blockchain_path' do
      expect(response).to redirect_to blockchain_path
    end

    it 'has the expected message' do
      expect(flash[:notice]).to eq '新しいトランザクションを追加します'
    end
  end
end