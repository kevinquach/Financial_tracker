require 'csv'

balance = 0
total_income = 0
overdraft = 0
overdraft_summary = []

#Read csv file into array
CSV.foreach('transactions.csv', headers: true) do |row|
  balance += row[1].to_f

  puts "Amount: #{row[1]}"
    if row[1].to_f > 0
      total_income += row[1].to_f
    end

  puts "Description: #{row[2]}"
  puts "Date: #{row[0]}"

#If balance < 0, charge overdraft fee, save row data
    if balance < 0
      overdraft += 20
      balance -= 20
      overdraft_summary << [balance.round(2), row[1], row[2], row[0]]
    end

  puts "Balance: #{balance.round(2)}"
  puts
end

#Print financial summary
  puts "Ending Balance: #{balance.round(2)}"

  puts "Total Income: #{total_income}"

  puts "Total Expenses: #{(total_income - balance).round(2)}"

  puts "Total Overdraft Charges: #{overdraft}"
  puts

#For each transaction that caused overdraft print current balance, transaction amount, description, and date on separate line
  puts "Overdrafts (balance, expense, description, date)"

  overdraft_summary.each do |item|
    print item.join(", ")
    puts
  end



