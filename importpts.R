
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # #                                                                 # # # #
# # # #                          PTS IMPORTATION                        # # # #
# # # #                 Written by N. chatar March 2020                 # # # #
# # # #                                                                 # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# MOST COMMON ERROR MESSAGE /!\ 

# Error in ptsarray[, , i] <- as.matrix(read.table(file = ptslist[i],  : 
# number of items to replace is not a multiple of replacement length

# MEANING: some of your pts files do not have the same lumber of landmarks or you entered the wrong number of landmarks. 
# check all the files in a notepad


import.pts <- function(Landmark) 
{
  wd <- getwd()
  
  # Create the list with .pts files located in the working directory
  ptslist <<- dir(path = paste(wd), pattern='.pts')
  ptslist
  
  
  # Creation of the array with the dimensions being A: number of landmarks + semilandmarks
  
  ptsarray <<- array(dim=c(Landmark,3,length(ptslist)))
  
  for(i in 1:length(ptslist))
  {
    ptsarray[,,i] <<- -as.matrix(read.table(file=ptslist[i],skip=2,header=F,sep="",row.names=1))
  }
  
  
  # Rename each specimen with the name of the ".pts" file by removing the .pts
  # ptsarray)[[3] if 3 dimensions, ptsarray)[[2] if only 2
  
  dimnames(ptsarray)[[3]] <<- c(substr(c(ptslist),1,nchar(c(ptslist))-4))
  
  # Rename each landmark its name from the pts file
  # ptsarray)[[3] if 3 dimensions, ptsarray)[[2] if only 2
  dimnames(ptsarray)[[1]] <<- c(read.table(file=ptslist[1],skip=2,header=F,sep="")[,1])

}
