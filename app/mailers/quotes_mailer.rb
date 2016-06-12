class QuotesMailer < ApplicationMailer
  def daily_inspiration(quote)
    @quote = quote
    mail(to: quote.user.email, subject: "Today's quote for reflection")
  end
end
