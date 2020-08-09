#### melt   -----> wide to long

sales_wide <- data.table(quarter = c(1,2,3,4),
                         "2015" = c("$1,000,100","$2,000,000","$3,000,000","$4,000,000"),
                         "2016" = c("$1,100,000","$2,100,000","$3,100,000","$4,100,000"))
sales_wide
#     quarter   2015       2016
#1:       1 $1,000,100 $1,100,000
#2:       2 $2,000,000 $2,100,000
#3:       3 $3,000,000 $3,100,000
#4:       4 $4,000,000 $4,100,000

sales_long <- melt(sales_wide, measure.vars = c("2015","2016"), variable.name = "year" , value.name = "amount")
sales_long
#     quarter year amount
#1:       1 2015 $1,000,100
#2:       2 2015 $2,000,000
#3:       3 2015 $3,000,000
#4:       4 2015 $4,000,000
#5:       1 2016 $1,100,000
#6:       2 2016 $2,100,000
#7:       3 2016 $3,100,000
#8:       4 2016 $4,100,000



#### dcast -----> long to wide

# dcast ( DT , ids ~ group , value.var = "values" )
#  ids ---> rows to use as identifiers = kept aside
#  group ---> group labels to split by  = used to split
#  "values" ---> columns to split

salesss_wide <- dcast(sales_long, quarter ~ year , value.var = "amount")
salesss_wide
#    quarter       2015       2016
#1:       1 $1,000,100 $1,100,000
#2:       2 $2,000,000 $2,100,000
#3:       3 $3,000,000 $3,100,000
#4:       4 $4,000,000 $4,100,000