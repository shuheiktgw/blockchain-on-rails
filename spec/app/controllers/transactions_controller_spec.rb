require 'rails_helper'

describe TransactionsController, type: :controller do
  describe 'POST #create' do

    before do
      post :create, params: { sender: sender, recipient: recipient, amount: amount }
    end

    describe '#check_required_create_params' do
      context 'when providing all the necessary params' do
        let(:sender) { 'test_sender' }
        let(:recipient) { 'test_recipient' }
        let(:amount) { 100 }

        it 'redirects_to blockchain_path' do
          expect(response).to redirect_to blockchain_path
        end

        it 'has the expected message' do
          expect(flash[:error]).to_not eq 'You need to provide amount parameter.'
        end
      end

      context 'when not providing all the necessary params' do
        let(:sender) { 'test_sender' }
        let(:recipient) { 'test_recipient' }
        let(:amount) { nil }

        it 'redirects_to blockchain_path' do
          expect(response).to redirect_to blockchain_path
        end

        it 'has the expected message' do
          expect(flash[:error]).to eq 'You need to provide amount parameter.'
        end
      end
    end

    # it 'redirects_to blockchain_path' do
    #   expect(response).to redirect_to blockchain_path
    # end
    #
    # it 'has the expected message' do
    #   expect(flash[:notice]).to eq '新しいトランザクションを追加します'
    # end
  end
end