myfunction <- function() {
	initial<-read.table("index.txt",nrows=100)
	classes<-sapply(initial,class)
	taball<-read.table("index.txt",colClasses=classes)
