# OpenFileDialog
#data <- read.csv(file.choose())
#data

# Working Directory
getwd()
setwd("C:\\Users\\USER\\Downloads\\DATA SCIENCE\\R Programming\\Section 5")
data <- read.csv("P2-Demographic-Data.csv")
data



#ExPLORING DATA
nrow(data) # 195 rows
ncol(data) # 5 cols
head(data) # top 6 rows
tail(data) # bottom 6 rows
str(data) # structure
summary(data)



# $
# ekuivalen:
data[3, 1]
data[3, "Country.Name"]
data$Country.Name[3]

levels(data$Income.Group)



# OPERATIONS
# subsetting
data[1:10, ] 

data[1, ]
is.data.frame(data[1, ]) # still a dataframe

data[,1]
is.data.frame(data[,1]) # factor
is.factor(data[,1])
data[,1,drop=F] # dataframe

# arithmetic
data$Birth.rate + data$Internet.users

# add cols
data$calculation <- data$Birth.rate + data$Internet.users
data

# recycle vector
data$xyz <- 1:5
data

# remove cols
data$calculation <- NULL
data$xyz <- NULL
data



# FILTERING
data[data$Internet.users < 2, ]
data[data$Birth.rate > 40 & data$Internet.users < 2, ]
data[data$Income.Group == "High income", ]

data[data$Country.Name == "Malta", ]



# Q PLOT
library(ggplot2)
qplot(data = data, x = Internet.users)
qplot(data = data, x = Income.Group, y = Birth.rate)
qplot(data = data, x = Income.Group, y = Birth.rate, size = I(3)) # I() so that 3 is not mapped to legend
qplot(data = data, x = Income.Group, y = Birth.rate, size = I(3), color = I("blue"))
qplot(data = data, x = Income.Group, y = Birth.rate, geom = "boxplot")


qplot(data = data, x = Internet.users, y = Birth.rate)
qplot(data = data, x = Internet.users, y = Birth.rate, size = I(3))
qplot(data = data, x = Internet.users, y = Birth.rate, size = I(3), color = Income.Group)



# COUNTRY REGION VECTORS
#Execute below code to generate three new vectors
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")

# CREATE DATAFRAME
df <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
colnames(df) <- c("Country", "Code", "Region")
str(df)
# atau
df <- data.frame(Country = Countries_2012_Dataset, Code = Codes_2012_Dataset, Region = Regions_2012_Dataset)
df



# MERGE DATA FRAME
head(data)
head(df)

merged.data <- merge(x = data, y = df,
                     by.x = "Country.Code", by.y = "Code")
# by.x = column data, by.y = column df
head(merged.data)

# remove duplicate column
merged.data$Country <- NULL
str(merged.data)



# Q PLOT (2)
qplot(data = merged.data, x = Internet.users, y = Birth.rate)
qplot(data = merged.data, x = Internet.users, y = Birth.rate, color = Region)
qplot(data = merged.data, x = Internet.users, y = Birth.rate, color = Region, size = I(5))
 
# 1. shape
qplot(data = merged.data, x = Internet.users, y = Birth.rate, color = Region, size = I(5), shape = I(2)) # shape from 0 to 25
qplot(data = merged.data, x = Internet.users, y = Birth.rate, color = Region, size = I(5), shape = Income.Group)

# 2. transparency
qplot(data = merged.data, x = Internet.users, y = Birth.rate, 
      color = Region, size = I(5), shape = I(1), alpha = I(0.6))

# 3. title
qplot(data = merged.data, x = Internet.users, y = Birth.rate, 
      color = Region, size = I(5), shape = I(1), alpha = I(0.6),
      main = "Birth Rate vs Internet Users")


