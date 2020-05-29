class Account

  NEGATIVE_BALANCE_FEE = 300 # R$ 3,00

  attr_accessor :id, :balance

  def initialize(id, balance)
    @id = id
    @balance = balance.to_i
  end

  def to_csv
    "#{id},#{balance}\n"
  end

  def update_balance(transaction)
    current_balance = @balance

    if transaction.type == "withdraw"
      new_balance = subtract(current_balance, transaction.value)
      new_balance = subtract(new_balance, NEGATIVE_BALANCE_FEE) if new_balance.negative?
    elsif transaction.type == "deposit"
      new_balance = sum(current_balance, transaction.value)
    end
    
    @balance = new_balance
  end

  private

  def sum(a,b)
    a + b
  end

  def subtract(a,b)
    a - b
  end
end