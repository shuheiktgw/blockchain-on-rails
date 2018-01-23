class BlockchainsController < ApplicationController
  def show
    @chain = Block.preload(:transactions).all
  end

  def mine
    flash[:notice] = '新しいブロックを採掘します'
  end
end
