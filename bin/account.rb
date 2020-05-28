class Account

  attr_accessor :id, :balance

  def initialize(id, balance)
    @id = id
    @balance = balance.to_i
  end

  def to_csv
    "#{id},#{balance}\n"
  end
end