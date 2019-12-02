#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
profit <- revenue - expenses
profit

tax <- round(0.3 * profit, digits = 2)
profit.tax <- profit - tax
profit.tax

profit.margin <- round(profit.tax/revenue, digits = 2) * 100
profit.margin

good.months <- profit.tax > mean(profit.tax)
good.months

bad.months <- !good.months
bad.months

best.month <- profit.tax == max(profit.tax)
best.month

worst.month <- profit.tax == min(profit.tax)
worst.month


# Output
revenue.1000 <- round(revenue/1000)
expenses.1000 <- round(expenses/1000)
profit.1000 <-round(profit/1000)
profit.tax.1000 <- round(profit.tax/1000)

mat <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)

mat