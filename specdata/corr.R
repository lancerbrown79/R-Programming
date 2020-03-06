corr <- function(directory, threshold = 0) {
  filelist <- list.files("/Users/lancer/Documents/R Programming/CourseEra/specdata/", pattern = "*.csv", full.names=TRUE)
  dat_csv <- ldply(filelist, read_csv)
  dat_csvcc <- complete.cases(dat_csv)
  cc1 <- dat_csv[dat_csvcc, ]
  z <- data.frame()
  for (i in 1:332) {
    rowcount <- nrow(filter(cc1, ID==i))
    if(rowcount < threshold) {
      print(as.numeric(c(0)))
    } else {
      thresh <- rbind(z, filter(cc1, ID==i))
      print(cor(thresh$nitrate, thresh$sulfate))
    }
  }
  
}

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
    tmp<-read.csv(paste("/Users/lancer/Documents/R Programming/CourseEra/specdata","/",as.character(id_fs),".csv", sep=""))
    tmp <- tmp[complete.cases(tmp),]
    cor<-cor(tmp$sulfate,tmp$nitrate)
    c<-c(c,cor)  
  }  
  
  # End
  return(c)
}

corr("specdata", 3)
getwd()
setwd()
id_fs<-formatC(1,width=3, flag="0")  
id_fs
tmp<-read.csv(paste("/Users/lancer/Documents/R Programming/CourseEra/specdata","/",as.character(id_fs),".csv", sep=""))
