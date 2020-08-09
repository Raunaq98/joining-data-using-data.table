## given two DT with same columns, we can do the following set operations :

# fintersect()  = which rows are common

# funion()   = rows present in both

# fsetdiff()  = rows present in only that DT


dt1 <- data.table( id = c(1,2,3,4,2,2),
                   animal = c("giraffe","lion","antelope","mouse","lion","lion"),
                   color = c("yellow","yellow","brown","grey","yellow","yellow"))

dt2 <- data.table( id = c(2,4,5,6,2),
                   animal = c("lion","mouse","whale","cassowary","lion"),
                   color = c("yellow","grey","blue","black","yellow"))

fintersect(dt1,dt2)
#    id animal  color
#1:  2   lion yellow
#2:  4  mouse   grey

fintersect(dt1,dt2, all=TRUE)   #keeping all copies
#   id animal  color
#1:  2   lion yellow
#2:  4  mouse   grey
#3:  2   lion yellow

fsetdiff(dt1,dt2)
#   id   animal  color
#1:  1  giraffe yellow
#2:  3 antelope  brown

fsetdiff(dt1,dt2,all=TRUE)
#id   animal  color
#1:  1  giraffe yellow
#2:  3 antelope  brown
#3:  2     lion yellow