class Runner
  def self.send_daily_emails
    User.find_each do |user|
      if quote = user.quotes.order("weight * RANDOM()").first
        QuotesMailer.daily_inspiration(quote).deliver_now
      end
    end
  end
end
