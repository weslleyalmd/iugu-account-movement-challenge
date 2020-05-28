require 'csv'
require_relative 'account'
require_relative 'transaction'

class Processor

  attr_reader :accounts, :transactions

  def initialize(accounts_path, transactions_path)
    @accounts = get_accounts(accounts_path)
    @transactions = get_transactions(transactions_path)
  end

  def run
    process

    puts @accounts.map {|a| a.to_csv}
  end

  def process
    @transactions.each do |transaction|
      account = @accounts.find {|a| a.id == transaction.account_id}

      if transaction.type == "withdraw"
        new_balance = subtract(account.balance, transaction.value)
      elsif transaction.type == "deposit"
        new_balance = sum(account.balance, transaction.value)
      end
      
      account.balance = new_balance
    end
  end

  def read(file_path)
    if File.exists? file_path
      return CSV.read(file_path)
    else
      puts "The file path is invalid"
      return nil
    end
  rescue
    puts "Invalid CSV file format"
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

  private

  def sum(a,b)
    a + b
  end

  def subtract(a,b)
    a - b
  end

end