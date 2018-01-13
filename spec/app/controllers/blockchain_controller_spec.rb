require 'rails_helper'

describe BlockchainsController, type: :controller do
  describe 'GET #show' do

    before do
      get :show
    end

    it 'returns 200' do
      expect(response).to have_http_status 200
    end
  end
end