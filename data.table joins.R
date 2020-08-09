### DT[ i , j , by ]     ----> standard form of data.table

### DT[ i , on]     -----> i = join to which DT
#                          on = using this key column

libraries <- c(library(dplyr),library(ggplot2),library(data.table))

demographics<- data.table( name = c("Trey","Matthew","Angela","Michelle"),
                           gender = c(NA,"M","F","F"),
                           age = c(54,43,39,63))

shipping<- data.table(name = c("Trey","Matthew","Abdullah","Angela"),
                      address = c("7 Mill Road","12 High Street","3a Union Street","33 Pacific Boulevard"))

demographics[shipping, on =.(name)]          # merge demo on shipping using name
# this is a default right join as all columns in shipping will be kept
# this is the same as :

merge(x=demographics,y=shipping,
      by.x="name",by.y="name",all.y=TRUE)

## left join:
shipping[demographics, on =.(name)] 

#hence, whatever is inside, its columns are retained

## inner join == intersection

demographics[shipping, on =.(name), nomatch=0 ]


## cannot do full join using this syntax, need to use merge()

## anti join == gives the columns that are present in first but not in second
demographics[!shipping, on =.(name)]
#        name   gender age
# 1: Michelle      F  63


### in case of multiple joins, we usually use "keys"

setkey(demographics,name)
setkey(shipping,name)
# inner join:
shipping[demographics,nomatch=0]
