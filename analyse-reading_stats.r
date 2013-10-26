# The script is to show some statistics of reading, such as speed etc

# Load data
setwd("//rubber/LearnReading"); 
d<-read.csv("reading-speed-time-log.csv", sep="\t", header=T)
d

summary(d)
speedOrig <- d$Words/d$ReadDurM

totalReadingTimeDays = sum(d$ReadDurM) / (60*24);
print(sprintf("Total reading time=%.2f days",totalReadingTimeDays));

# Take whole reading period of 18 month
readTimePerDay = sum(d$ReadDurM) / (18*30)
print(sprintf("Avg read time per day = %.2f min",readTimePerDay));

## Reading speed
speed <- speedOrig[is.finite(speedOrig)] # remove Inf

# remove outliers
expectMaxSpeed <- mean(speed)+4*sd(speed)
print(sprintf("Expected max reading speed=%.2f", expectMaxSpeed))

#speed <- speedOrig; # keep outliers
speed <- speedOrig[speedOrig < expectMaxSpeed]
speed

# Show some graphics

# Reading speed
summary(speed)
hist(speed, breaks=120)
scatter.smooth(speed)

speedFitLine <- line(speed)
speedFitLine
abline(speedFitLine, col="red")


## Duration of reading per one sitting
dur <- d$ReadDurM
dur <- dur[is.finite(dur)] # remove Inv
summary(dur)
hist(dur, breaks=120)

## Speed of reading vs Duration of reading
validValues <- is.finite(d$ReadDurM);
dur <- d$ReadDurM[validValues];
speed <- d$Words/d$ReadDurM;
speed <- speed[validValues];
#plot(dur, speed)
scatter.smooth(dur, speed)