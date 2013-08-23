require 'csv'

#Process each transaction sequentially

#Balance starts at 0.00, the amount of each transaction is added to the balance in order
@balance = 0
@total_income = 0
@overdraft = 0
@balance_overdraft = []


#Read csv file into array
CSV.foreach('transactions.csv', headers: true) do |row|
  @balance += row[1].to_f

  print "Amount: #{row[1]} | "
    if row[1].to_f > 0
      @total_income += row[1].to_f
    end
  print "Description: #{row[2]} | "
  print "Date: #{row[0]} | "
    if @balance < 0
      print "OVERDRAFT |"
      @overdraft += 20
      @balance -= 20
      @balance_overdraft << @balance.round(2)
      @balance_overdraft << row[1]
    end
  print "Balance: #{@balance.round(2)}"

  puts

end
  #If balance < 0
    # Charge overdraft fee of 20.00

  #Else do nothing

#Print financial summary
  #Print ending balance after processing all transactions
  puts "Ending Balance: #{@balance.round(2)}"
  #Print total income after processing all transactions
  puts "Total income: #{@total_income}"
  #Print total expenses after processing all transactions
  puts "Total expenses: #{(@total_income - @balance).round(2)}"
  #Print total overdraft
  puts "Total overdraft: #{@overdraft}"
#Print overdraft summary
  #Print total overdraft charges

  puts "Overdrafts (balance, expense, description, date)"
  puts @balance_overdraft

  #Print the heading after the total overdraft charges
  #For each transaction that caused overdraft print current balance, transaction amount, description, and date on separate line


