class Quote < ActiveRecord::Base
  acts_as_taggable_on :tags

  belongs_to :user

  validates :user, presence: true
  validates :quote, presence: true
  validates :weight, presence: true

  def quote_snippet
    if quote.length > 100
      "#{quote[0..100]}..."
    else
      quote
    end
  end

  def rendered_json
    { quote: quote,
      source: source,
      weight: weight }
  end
end
