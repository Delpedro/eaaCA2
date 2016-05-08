# X00106072 (Derek Mulhern)

# The following are R commands to carry out the required calculations as
# per the instructions in the CA in order to produce 4 graphs. 

# The required calculations are as follows;
# UI vs N / DI vs N / Xo vs N / R vs N


# Before plotting the graphs, the data produced from the run script
# must be imported into R. The following command allows a user to import 
# this data and from this information we can produce the 4 graphs.

loadtestData <- read.table("results.dat", header=TRUE);


# The data collected using the run script in part A which included the mpstat 
# command for the last column Idle collects #the data in percentage. In order 
# to get a more accurate graph the following commands are required to 
# convert to busy time and to convert the percentage time given from mpstat


par(col.lab="red");
par(col.main="blue")
pch=19;
lty=3;

# Graph No.1 - Ui(Utilisation) vs. N(# of concurrent users)

busy<-100-loadtestData$IDLE;

# Utilisation is like a false ceiling, it cannot go above 1 (100%). It can only be between 0 - 1 as per the grapgh.
utilisation_ui<-busy/100;

png("Utilisation.png");
par(col.lab="red");
par(col.main="blue")

plot(utilisation_ui, type="l", lwd=2, lty=5, pch=19, xlab="N - Concurrent Users", ylab="Ui - Utilisation", main="Ui (Utilistion) vs. N (# of Concurrent Users)");
dev.off();


# Graph No.2 - Xo(Throughput) vs. N(# of concurrent users)

throughput_xo<-loadtestData$CO/9;

png("Throughput.png");
par(col.lab="red");
par(col.main="blue")
plot(throughput_xo, type="l", lwd=2, lty=5, pch=19, xlab="N - Concurrent Users", ylab="Xo - Throughput", main="Xo (Throughput) vs. N (# of Concurrent Users)");
dev.off();

# Graph No.3 - Di(Sevice Demand) vs. N(# of concurrent users)

service_demand_di<-utilisation_ui / throughput_xo;

png("Service_Demand.png");
par(col.lab="red");
par(col.main="blue")
plot(service_demand_di, type="l", lwd=2, lty=5, pch=19, xlab="N - Concurrent Users", ylab="Di - Service Demand", main="Di (Service Demand) vs. N (# of Concurrent Users)");
dev.off();

# Graph No.4 - R (Response Time) vs. N(# of concurrent users)

numOfUsers<-loadtestData$N;
respon_time_r<-numOfUsers/throughput_xo;

png("Response_Time.png");
par(col.lab="red");
par(col.main="blue")
plot(respon_time_r, type="l", lwd=2, lty=5, pch=19, xlab="N - Concurrent Users", ylab="R - Response Time", main="R (Response TIme) vs. N (# of Concurrent Users)");
dev.off();




