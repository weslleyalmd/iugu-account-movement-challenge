class Transaction

  attr_accessor :account_id, :value, :type

  def initialize(account_id, value)
    @account_id = account_id
    @value = value.to_i.abs
    @type = set_type(value.to_i)
  end

  private

  def set_type(v)
    v.negative? ? "withdraw" : "deposit"
  end

end