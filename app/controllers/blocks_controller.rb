class TransactionsController < ApplicationController
  def create
    flash[:notice] = '新しいトランザクションを追加します'
  end
end