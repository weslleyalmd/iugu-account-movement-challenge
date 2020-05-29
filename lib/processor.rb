require 'csv'
require_relative 'account'
require_relative 'transaction'

class Processor

  attr_reader :accounts, :transactions

  def initialize(accounts_path, transactions_path)
    @accounts = get_accounts(accounts_path)
    @transactions = get_transactions(transactions_path)
  rescue StandardError => e
    return e.message
  end

  def run
    process_transactions

    @accounts.map {|a| a.to_csv}
  rescue StandardError => e
    return e.message
  end

  private

  def process_transactions
    raise StandardError.new "Invalid data" if !@accounts && !@transactions

    @transactions.each do |transaction|
      account = @accounts.find {|a| a.id == transaction.account_id}
      account.update_balance(transaction)
    end
  end

  def read(file_path)
    if File.exists? file_path
      return CSV.read(file_path)
    else
      raise StandardError.new "The file path is invalid"
    end
  end

  def get_accounts(file_path)
    accounts = []
    file = read(file_path)
    file.each do |a|
      id = a.first
      balance = a.last
      accounts << Account.new(id, balance)
    end

    accounts
  end

  def get_transactions(file_path)
    transactions = []
    file = read(file_path)
    file.each do |t|
      account_id = t.first
      value = t.last
      transactions << Transaction.new(account_id, value)
    end

    transactions
  end

end