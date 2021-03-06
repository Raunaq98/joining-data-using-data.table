## rbind()  ---> takes input of DT and concatinates them in that order

sales_2015<- data.table( quarter = c(1,2,3,4),
                         amount = c("$3,200,00","$2,950,000","$2,980,700","$3,420,000"))

sales_2016<- data.table( quarter = c(1,2,3,4),
                         amount = c("$3,350,000","$3,000,300","$3,120,200","$3,670,000"))


rbind(sales_2015,sales_2016)
#     quarter  amount
#1:       1  $3,200,00
#2:       2 $2,950,000
#3:       3 $2,980,700
#4:       4 $3,420,000
#5:       1 $3,350,000
#6:       2 $3,000,300
#7:       3 $3,120,200
#8:       4 $3,670,000

rbind("2015" = sales_2015 , "2016" = sales_2016 , idcol = "year")
#   year    quarter  amount
#1: 2015       1  $3,200,00
#2: 2015       2 $2,950,000
#3: 2015       3 $2,980,700
#4: 2015       4 $3,420,000
#5: 2016       1 $3,350,000
#6: 2016       2 $3,000,300
#7: 2016       3 $3,120,200
#8: 2016       4 $3,670,000

## working with dt with diff number of cols

salesss_2015<- data.table( quarter = c(1,2,3,4),
                         amount = c("$3,200,00","$2,950,000","$2,980,700","$3,420,000"))

salesss_2016<- data.table( quarter = c(1,2,3,4),
                         amount = c("$3,350,000","$3,000,300","$3,120,200","$3,670,000"),
                         revenue = c("$1,860,000","$1,500,000","$1,307,000","$2,400,000"))
rbind("2015" = salesss_2015 , "2016" = salesss_2016 , idcol = "year" , fill = TRUE)
#   year  quarter   amount    revenue
#1: 2015       1  $3,200,00       <NA>
#2: 2015       2 $2,950,000       <NA>
#3: 2015       3 $2,980,700       <NA>
#4: 2015       4 $3,420,000       <NA>
#5: 2016       1 $3,350,000 $1,860,000
#6: 2016       2 $3,000,300 $1,500,000
#7: 2016       3 $3,120,200 $1,307,000
#8: 2016       4 $3,670,000 $2,400,000

