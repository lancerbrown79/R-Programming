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
