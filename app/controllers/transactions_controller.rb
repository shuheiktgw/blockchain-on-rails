class TransactionsController < ApplicationController
  def create
    flash[:notice] = '新しいトランザクションを追加します'
    redirect_to blockchain_path
  end
end