complete <- function(directory, id = 1:332) {
  filelist <- list.files("/Users/lancer/Documents/R Programming/CourseEra/specdata/", pattern = "*.csv", full.names=TRUE)
  nobs <- numeric()
  for(i in id) {
    cc <- read.csv(filelist[i])
    nobs <- c(nobs, sum(complete.cases(cc)))
  }
  cctable <- data.frame(id, nobs)
  print(cctable)
}