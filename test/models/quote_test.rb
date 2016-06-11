require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  test "validations" do
    # valid by default
    @quote = build(:quote)
    assert @quote.valid?
    # user is required
    @quote = build(:quote, user: nil)
    refute @quote.valid?
    # quote is required
    @quote = build(:quote, quote: "")
    refute @quote.valid?
    # source is optional
    @quote = build(:quote, source: "")
    assert @quote.valid?
    # weight is required
    @quote = build(:quote, weight: nil)
    refute @quote.valid?
  end
end
