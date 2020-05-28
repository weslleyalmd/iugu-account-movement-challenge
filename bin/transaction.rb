class Transaction

  attr_accessor :account_id, :value, :type

  def initialize(account_id, value)
    @account_id = account_id
    @value = value
    @type = set_type(value)
  end

  private

  def set_type(value)
    value.negative? ? "withdraw" : "deposit"
  end

end