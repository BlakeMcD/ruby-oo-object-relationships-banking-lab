class Transfer
  # your code here

  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
  @status = "pending"
  @sender = sender
  @receiver = receiver
  @amount = amount
  end

  # def valid?
  #   if sender.status == "open" && sender.balance > 0 
  #     if receiver.status == "open" 
  #       return true
  #     else 
  #       return false
  #     end
  #   else 
  #     return false
  #   end
  # end

  #attempt 2
  def valid?
      if sender.valid? == true && receiver.valid? == true
        return true
      else
        return false
      end
  end

  # def execute_transaction

  #   if self.status == "pending"
  #     if sender.valid? == true
  #       if (sender.balance - @amount) > 0
  #         sender.balance -= @amount
  #         receiver.balance += @amount
  #         self.status = "complete"
  #       else
  #         "Transaction rejected. Please check your account balance."
  #       end
  #     else 
  #       "Transaction rejected. Please check your account balance."
  #     end
  #   end
  # end

  def execute_transaction
    if valid? && (sender.balance - @amount) > 0 && self.status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
        sender.balance += @amount
        receiver.balance -= @amount
        self.status = "reversed"
    end
  end

end
