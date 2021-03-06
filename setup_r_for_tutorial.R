#####################
# Setup R Session for tutorials
#####################

# Install required packages

install_new<-function(mypkg){
  if (mypkg %in% installed.packages()) cat("Package already installed")
  else{cat("Package not found, so installing with dependencies... Press CTRL C to abort.")
    Sys.sleep(5)
    install.packages(mypkg,repos="http://cran.wustl.edu/")
}
}

install_new('plyr')
install_new('lmtest')
install_new('ggplot2')
install_new('gridExtra')
install_new('stringr')

# Source non-package scripts
dropbox_source<-function(myurl){
  require(stringr)
  s<-str_extract(myurl,"[/][a-z][/]\\d+[/][a-z]*.*")
  new_url<-paste("http://dl.dropbox.com",s,sep="")
  source(new_url)
}

ggthemes<-"https://dl.dropbox.com/u/1811289/ggplot2themes.R"
dropbox_source(ggthemes)
colwheel<-"https://dl.dropbox.com/u/1811289/colorwheel.R"
dropbox_source(colwheel)

# Read in and download Data

library(foreign)
mystatadata<-read.dta("https://github.com/jknowles/r_tutorial_ed/raw/master/data/Student_Attributes.dta")
mydata<-read.csv('https://github.com/jknowles/r_tutorial_ed/raw/master/data/smalldata.csv')

midwestschools<-read.csv("https://github.com/jknowles/r_tutorial_ed/raw/master/data/midwest_schools.csv")

midwestdist<-read.csv("https://raw.github.com/jknowles/r_tutorial_ed/master/data/midwest_district_probability.csv")


# Generate Student Data
source("https://raw.github.com/jknowles/r_tutorial_ed/master/data/simulate_data.R")