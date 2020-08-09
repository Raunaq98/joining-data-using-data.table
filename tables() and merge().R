# inspecting all DT in your environment

libraries <- c(library(dplyr),library(ggplot2),library(data.table))

demographics<- data.table( name = c("Trey","Matthew","Angela","Michelle"),
                           gender = c(NA,"M","F","F"),
                           age = c(54,43,39,63))

shipping<- data.table(name = c("Trey","Matthew","Abdullah","Angela"),
                      address = c("7 Mill Road","12 High Street","3a Union Street","33 Pacific Boulevard"))

tables()
#           NAME NROW NCOL MB            COLS KEY
#1: demographics    4    3  0 name,gender,age    
#2:     shipping    4    2  0    name,address    
#Total: 0MB

# we now know we can join using the "name" column



### merge() can be inner, full, left, right


# inner join is the intersection of two tables and is the default behaviour of the merge() function

merge(x=demographics,y=shipping,
      by.x="name",by.y="name")

#       name gender age              address
#1:  Angela      F  39 33 Pacific Boulevard
#2: Matthew      M  43       12 High Street
#3:    Trey   <NA>  54          7 Mill Road
# entries for abdullah and michelle are ignored


# full join is the union of both the tables

merge(x=demographics,y=shipping,
      by.x="name",by.y="name",all=TRUE)

#name gender age              address
#1: Abdullah   <NA>  NA      3a Union Street
#2:   Angela      F  39 33 Pacific Boulevard
#3:  Matthew      M  43       12 High Street
#4: Michelle      F  63                 <NA>
#5:     Trey   <NA>  54          7 Mill Road


# left joins keep all the obs present in first table

merge(x=demographics,y=shipping,
      by.x="name",by.y="name",all.x=TRUE)

#       name gender age              address
#1:   Angela      F  39 33 Pacific Boulevard
#2:  Matthew      M  43       12 High Street
#3: Michelle      F  63                 <NA>
#4:     Trey   <NA>  54          7 Mill Road

# right join keeps all the obs present in the second table

merge(x=demographics,y=shipping,
      by.x="name",by.y="name",all.y=TRUE)

#name gender age              address
#1: Abdullah   <NA>  NA      3a Union Street
#2:   Angela      F  39 33 Pacific Boulevard
#3:  Matthew      M  43       12 High Street
#4:     Trey   <NA>  54          7 Mill Road