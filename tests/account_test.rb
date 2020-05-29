require 'test/unit'
require_relative '../lib/account.rb'

class AccountTest < Test::Unit::TestCase

  def setup
    @account = Account.new(1,100)
  end

  def test_to_csv
    assert_equal "1,100\n", @account.to_csv
  end

end