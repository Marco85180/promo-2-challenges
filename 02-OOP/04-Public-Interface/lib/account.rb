require_relative 'transaction'

# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount

  # Contract for the BankAccount class
  # - you can access full owner's name and position, but partial IBAN
  attr_reader :name, :position, :hidden_iban
  # - you cannot access full IBAN

  # - you can print partial account infos

  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the position variable)

  MIN_DEPOSIT =  100

  def initialize(name, iban, initial_deposit, password)
    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    # TODO: Call add_transaction with the right argument
    add_transaction(-amount)
    # TODO: returns a string with a message
    return "Your withdraw : #{amount}"
  end

  def deposit(amount)
    # TODO: Call add_transaction with the right argument
    add_transaction(amount)
    # TODO: returns a string with a message
    return "Your desposit : #{amount}"
  end

  def transactions_history(args = {})
    # TODO: Check if there is a password and if so if it is correct
    transaction_cop = @transactions
    transaction_cop.join(", ")
    if args[:password] == @password
      "Here your transactions_history : #{transaction_cop} "
    elsif args.empty?
      "no password given"
    else
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array !
      "wrong password"
    end
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    "Owner : #{@name}, IBAN : #{iban}, Current amount: #{@position} euros"
    # TODO: Displays the account owner, the hidden iban and the position of the account
  end

    def iban
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
    @hidden_iban = @iban
    @hidden_iban[4..-4] = "**************"
    @hidden_iban
  end

  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array
    @transactions << Transaction.new(amount)
    # TODO: update the current position (which represents the balance of the account)
    @position = @transactions.reduce(:+)
  end

end
