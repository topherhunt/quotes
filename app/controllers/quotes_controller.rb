class QuotesController < ApplicationController
  before_action :require_login

  def index
    @quotes = current_user.quotes
    filter_quotes
    respond_to do |format|
      format.html
      format.json { render json: @quotes.map(&:rendered_json) }
    end
  end

  def new
    @quote = Quote.new(weight: 1)
  end

  def create
    @quote = Quote.new(quote_params.merge(user: current_user))
    if @quote.save
      redirect_to new_quote_path, notice: "Quote created. Create another?"
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
    params.require(:quote).permit(:quote, :source, :weight, :tag_list)
  end

  def filter_quotes
    if f = params[:filter]
      if f[:tag].present?
        @quotes = @quotes.tagged_with(f[:tag])
      end

      if f[:full_text].present?
        @quotes = @quotes.where("quote ILIKE ? OR source ILIKE ?",
          "%#{f[:full_text]}%",
          "%#{f[:full_text]}%")
      end
    end
  end
end
