require 'test/unit'
require_relative '../lib/processor.rb'

class ProcessorTest < Test::Unit::TestCase

  def setup
    @accounts_file_path = File.expand_path('tests/resources/account.csv')
    @transactions_file_path = File.expand_path('tests/resources/transaction.csv')

    expected_variables

  end

  ### Process all transaction
  def test_run
    processor = Processor.new(@accounts_file_path, @transactions_file_path)

    final_result = processor.run
    assert_equal @final_csv, final_result
  end

  private

  def expected_variables
    @final_csv = ["1,130\n", "2,2100\n"]
  end
end