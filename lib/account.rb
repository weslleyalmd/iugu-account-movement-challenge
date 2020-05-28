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
end