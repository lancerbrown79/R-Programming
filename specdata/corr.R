
corr <- function(directory, threshold=0) {
  
  # Use complete to get cases and numer of complete records
  cases_ncomplete<-complete(directory,1:332)
  
  # Select only cases within the threshold
  selected_cases<-subset(cases_ncomplete, nobs>threshold, select = id)
  selected_cases<-as.vector(selected_cases$id)
  
  # Initialize the vector
  c<-c()
  
  # Correlation between sulfate and nitrate for the selected cases
  for (i in selected_cases) {      
    id_fs<-formatC(i,width=3, flag="0")   
    tmp<-read.csv(paste(directory,"/",as.character(id_fs),".csv", sep=""))
    tmp <- tmp[complete.cases(tmp),]
    cor<-cor(tmp$sulfate,tmp$nitrate)
    c<-c(c,cor)  
  }  
  
  # End
  return(c)
}

