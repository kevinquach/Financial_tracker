require 'csv'

#Process each transaction sequentially

#Balance starts at 0.00, the amount of each transaction is added to the balance in order
@balance = 0
@total_income = 0
@total_expenses = 0
@overdraft = 0

#Read csv file into array
CSV.foreach('transactions.csv', headers: true) do |row|
  @balance += row[1].to_f

  puts "Date: #{row[0]}"
  puts "Amount: #{row[1]}"
  puts "Description: #{row[2]}"
  puts "Balance: #{@balance.round(2)}"
end
  #If balance < 0
    # Charge overdraft fee of 20.00
    @overdraft += 20
  #Else do nothing

#Print financial summary
  #Print ending balance after processing all transactions
  puts "Ending Balance: #{@balance.round(2)}"
  #Print total income after processing all transactions
  puts "Total income: #{@total_income}"
  #Print total expenses after processing all transactions
  puts "Total expenses: #{@total_expenses}"

#Print overdraft summary
  #Print total overdraft charges
  #Print the heading after the total overdraft charges
  #For each transaction that caused overdraft print current balance, transaction amount, description, and date on separate line
