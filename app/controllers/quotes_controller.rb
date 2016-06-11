class QuotesController < ApplicationController
  before_action :require_login

  def index
    @quotes = current_user.quotes
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params.merge(user: current_user))
    if @quote.save
      redirect_to quotes_path, notice: "Quote created."
    else
      render "new"
    end
  end

  def edit
    @quote = current_user.quotes.find(params[:id])
  end

  def update
    @quote = current_user.quotes.find(params[:id])
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote updated."
    else
      render "edit"
    end
  end

  def show
    @quote = current_user.quotes.find(params[:id])
  end

  def destroy
    @quote = current_user.quotes.find(params[:id])
    @quote.destroy!
    redirect_to quotes_path, notice: "Quote destroyed."
  end

  private

  def quote_params
    params.require(:quote).permit(:quote, :source, :weight)
  end
end
