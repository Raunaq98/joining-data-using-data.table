## DT1 [DT2 , on] [ i , j , by]...

customers <- data.table( name = c ("Mark","Matt","Angela","Michelle"),
                         gender = c("M","M","F","F"),
                         age = c( 54,43,39,63))

purchases <- data.table( name = c("Mark","Matt","Angela","Michelle"),
                         sales = c( 1,5,4,3),
                         spent = c(41.70,  41.78,  50.77,  60.01))

# average spent per sale grouped by gender :
customers[purchases, on= .(name)][, 
                                  .(avg_spent = sum(spent) / sum(sales)), 
                                  by= .(gender)]
#    gender avg_spent
#1:      M  13.91333
#2:      F  15.82571


#### computation with joins

# DT1 [ DT2 , on , j ]
temp1<- customers
temp2<- purchases
temp1[temp2, on= .(name) , return_cust := sales >1]
temp1
#        name gender age return_cust
#1:     Mark      M  54       FALSE
#2:     Matt      M  43        TRUE
#3:   Angela      F  39        TRUE
#4: Michelle      F  63        TRUE

# chnages made to the main table itself