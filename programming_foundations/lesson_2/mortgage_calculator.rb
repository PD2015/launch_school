# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration

# From the above, you'll need to calculate the following two things:

# monthly interest rate
# loan duration in months

# Given a loan amount of L
#       and APR of y%
#       over z years

# monthly interest rate

# v=apr/12 /100
# This will give a decimal representing the monthly interest rate.

# loan duration in months
# w = x years / 12

# to calculate the monthly payment

#  fixed monthly payment (P) required to fully amortize a loan of L
#  dollars over a term of n months at a monthly interest rate of c.
#  [If the quoted rate is 6%, for example, c is .06/12 or .005]

#   P = L[c(1 + c)n]/[(1 + c)n - 1]
#    P = x[v(1 + v)w]/[(1 + )w - 1]

# to caluculate remaining loan balance (B) of a fixed payment
# loan after p months.
# B = L[(1 + c)n - (1 + c)p]/[(1 + c)n - 1]

def prompt(message)
  puts "=> #{message}"
end

prompt("welcome to the Mortgage Calculator")

loop do
  amount = ''
  prompt("Please enter the total Loan left to repay")
  loop do
    amount = gets.chomp
    if amount.empty? || amount.to_f < 0
      prompt("Please add a positive value")
    else
      break
    end
  end

  interest_rate = ''
  prompt("Please enter the Annual Percentage Rate(APR) of your loan. If 4% input 4 if 2.5% input 2.5")
  loop do
    interest_rate = gets.chomp
    if interest_rate.empty? || interest_rate.to_f < 0
      prompt("Sorry, please add a positive rate of interest")
    else
      break
    end
  end

  years = ''
  prompt("Please enter the duration left for repayment of your loan in years")
  loop do
    years = gets.chomp
    if years.empty? || years.to_i < 0
      prompt("please enter the number of years remaining")
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i() * 12

  monthly_payment = amount.to_f() *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-months.to_i()))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")
  prompt("Is that everything or would you like to run another calculation? (if yes please enter y)")
  answer = gets.chomp.downcase
  break unless answer.start_with?("y")
end

puts <<-MSG
Thank you for using the mortage calculator
Good Bye
MSG
