class Transaction

  attr_accessor :account_id, :value, :type

  def initialize(account_id, value)
    @account_id = account_id
    @value = value.to_i
    @type = set_type
  end

  private

  def set_type
    @value.negative? ? "withdraw" : "deposit"
  end

end