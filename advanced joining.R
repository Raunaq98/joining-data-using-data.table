customer <- data.table(name = c("Madeline Martin","Madeline Bernard","George Dimakos"),
                       gender = c("F","F","M"),
                       address = c("5 Market Lane" ," 4 Jacaranda crescent", " 2a Park Square"))

web_visits <- data.table( person = c("Madeline Martin","Madeline Martin","Madeline Bernard","George Dimakos"),
                          date = c("2018-05-02","2018-05-03","2018-05-03","2018-04-27"),
                          duration = c(5,32,12,45))

## it may happen that two DTs may have diff column names for the key column
customer[web_visits,  on= .(name=person)]
#name gender               address       date duration
#1:  Madeline Martin      F         5 Market Lane 2018-05-02        5
#2:  Madeline Martin      F         5 Market Lane 2018-05-03       32
#3: Madeline Bernard      F  4 Jacaranda crescent 2018-05-03       12
#4:   George Dimakos      M        2a Park Square 2018-04-27       45


## if there are more columns you want to use:
# on= .(name = person , ... , ... , ...)

## use setnames() to change irregularities in names
# setnames(customer, c("1","2","3"))
