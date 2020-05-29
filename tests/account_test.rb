require 'test/unit'
require_relative '../lib/account.rb'
require_relative '../lib/transaction.rb'

class AccountTest < Test::Unit::TestCase

  def setup
    @deposit = Transaction.new(1,100)
    @withdraw = Transaction.new(1,-50)
    @withdraw_apply_fee = Transaction.new(1,-10300)
  end

  def test_to_csv
    account = Account.new(1,100)
    assert_equal "1,100\n", account.to_csv
  end

  def test_update_balance_deposit
    account = Account.new(1,100)
    account.update_balance(@deposit)
    assert_equal 200, account.balance
  end

  def test_update_balance_withdraw
    account = Account.new(1,100)
    account.update_balance(@withdraw)
    assert_equal 50, account.balance
  end

  def test_update_balance_withdraw_apply_fee
    account = Account.new(1,10000)
    account.update_balance(@withdraw_apply_fee)
    assert_equal -600, account.balance
  end

end