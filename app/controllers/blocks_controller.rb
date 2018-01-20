class BlocksController < ApplicationController
  def create
    flash[:notice] = '新しいブロックを採掘します'
    redirect_to blockchain_path
  end
end