# The script is to show some statistics of reading, such as speed etc

# Load data
setwd("//rubber/LearnReading"); 

d<-read.csv("reading-speed-time-log.csv", sep="\t", header=T)
d

summary(d)
speedOrig <- d$Words/d$ReadDurM

# reading speed
speed <- speedOrig[is.finite(speedOrig)] # remove Inf

# remove outliers
expectMaxSpeed <- mean(speed)+4*sd(speed)
#speed <- speedOrig; # keep outliers
speed <- speedOrig[speedOrig < expectMaxSpeed]
speed

# Show some graphics

# reading speed
summary(speed)
hist(speed, breaks=120)
scatter.smooth(speed)

# duration of reading per one sitting
dur <- d$ReadDurM
dur <- dur[is.finite(dur)] # remove Inv
summary(dur)
hist(dur, breaks=120)
