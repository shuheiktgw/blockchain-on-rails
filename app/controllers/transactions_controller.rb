class TransactionsController < ApplicationController

  before_action :check_required_create_params

  def create
    flash[:notice] = 'Added a new transaction!'
    redirect_to blockchain_path
  end

  private

  def check_required_create_params
    [:sender, :recipient, :amount].each do |p|
      if params[p].blank?
        flash[:error] = "You need to provide #{p} parameter."
        redirect_to blockchain_path
        break
      end
    end
  end

end