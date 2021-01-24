#import data
library(readxl)
Eq_SZone_I <- read_excel("C:/Users/admin/Downloads/EQ/Eq_SZone_I.xlsx", 
                         col_types = c("numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "text", "numeric", "numeric", "skip", 
                                       "skip", "skip", "skip"))

Eq_SZone_II <- read_excel("C:/Users/admin/Downloads/EQ/Eq_SZone_II.xlsx", 
                         col_types = c("numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "text", "numeric", "numeric", "skip", 
                                       "skip", "skip", "skip"))

Eq_SZone_III <- read_excel("C:/Users/admin/Downloads/EQ/Eq_SZone_III.xlsx", 
                         col_types = c("numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "text", "numeric", "numeric", "skip", 
                                       "skip", "skip", "skip"))
Eq_SZone_IV <- read_excel("C:/Users/admin/Downloads/EQ/Eq_SZone_IV.xlsx", 
                         col_types = c("numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "text", "numeric", "numeric", "skip", 
                                       "skip", "skip", "skip"))
Eq_SZone_V <- read_excel("C:/Users/admin/Downloads/EQ/Eq_SZone_V.xlsx", 
                         col_types = c("numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "text", "numeric", "numeric", "skip", 
                                       "skip", "skip", "skip"))


Eq_SZone_NWH <- read_excel("C:/Users/admin/Downloads/EQ/EQDATANWH.xls")

Eq_SZone <- rbind.data.frame(Eq_SZone_I,Eq_SZone_II,Eq_SZone_III,Eq_SZone_IV,Eq_SZone_V)



#read data
library(DT)
datatable(Eq_SZone_I)
datatable(Eq_SZone_II)
datatable(Eq_SZone_III)
datatable(Eq_SZone_IV)
datatable(Eq_SZone_V)
datatable(Eq_SZone)
datatable(Eq_SZone_NWH)



#Analysis
library(ggplot2)
ggplot(Eq_SZone_I, aes(x=mag)) + 
  geom_histogram(fill="blue",bins = 25)+
  xlab("Magnitude")+
  ylab("Frequency")+
  ggtitle("Magnitude VS frequency plot in zone SZ1")

ggplot(Eq_SZone_II, aes(x=mag)) + 
  geom_histogram(fill="blue",bins = 25)+
  xlab("Magnitude")+
  ylab("Frequency")+
  ggtitle("Magnitude VS frequency plot in zone SZ2")

ggplot(Eq_SZone_III, aes(x=mag)) + 
  geom_histogram(fill="blue",bins = 25)+
  xlab("Magnitude")+
  ylab("Frequency")+
  ggtitle("Magnitude VS frequency plot in zone SZ3")

ggplot(Eq_SZone_IV, aes(x=mag)) + 
  geom_histogram(fill="blue",bins = 25)+
  xlab("Magnitude")+
  ylab("Frequency")+
  ggtitle("Magnitude VS frequency plot in zone SZ4")

ggplot(Eq_SZone_V, aes(x=mag)) + 
  geom_histogram(fill="blue",bins = 25)+
  xlab("Magnitude")+
  ylab("Frequency")+
  ggtitle("Magnitude VS frequency plot in zone SZ5")

ggplot(Eq_SZone, aes(x=mag)) + 
  geom_histogram(fill="blue",bins = 25)+
  xlab("Magnitude")+
  ylab("Frequency")+
  ggtitle("Magnitude VS frequency plot in zone SZ in Total")

ggplot(Eq_SZone_NWH, aes(x=mag)) + 
  geom_histogram(fill="blue",bins = 25)+
  xlab("Magnitude")+
  ylab("Frequency")+
  ggtitle("Magnitude VS frequency plot in zone SZ NWH")

# Analysis 2
Eq_SZone_I$zone <- 1
datatable(Eq_SZone_I)

Eq_SZone_II$zone <- 2

Eq_SZone_III$zone <- 3

Eq_SZone_IV$zone <- 4

Eq_SZone_V$zone <- 5

Eq_SZone_NWH$zone <- 6


Eq_SZone_total <- rbind.data.frame(Eq_SZone_I,Eq_SZone_II,Eq_SZone_III,Eq_SZone_IV,Eq_SZone_V)

## filter all magnitude of 5 and above
library(dplyr)
library(pillar)
filter_5_mag <- Eq_SZone_total %>% filter(mag >= 5.0) 

#ploting the values
ggplot(filter_5_mag,aes(x=zone,fill="blue"))+
  geom_bar()+
  xlab("zone")+
  ylab("Frequency of EQ greater than 5")+
  ggtitle("Most Vulnerable Zone Analysis")

#coordinate analysis

install.packages(c("cowplot", "googleway", "ggplot2", "ggrepel", "ggspatial", "libwgeom", "sf", "rnaturalearth", "rnaturalearthdata"))

library(rlang)
library(ggplot2)
library(rgeos)
theme_set(theme_bw())
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)

world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

ggplot(data = world) +
  geom_sf()

ggplot(data = world) +
  geom_sf() +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("World map", subtitle = paste0("(", length(unique(world$name)), " countries)"))

ggplot(data = world) +
  geom_sf(aes(fill = pop_est)) +
  scale_fill_viridis_c(option = "plasma", trans = "sqrt")

ggplot(data = world) +
  geom_sf() +
  coord_sf(crs = "+proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +ellps=GRS80 +units=m +no_defs ")


ggplot(data = world) +
  geom_sf() +
  coord_sf(crs = "+init=epsg:3035")

ggplot(data = world) +
  geom_sf() +
  coord_sf(crs = st_crs(3035))

ggplot(data = world) +
  geom_sf() +
  coord_sf(xlim = c(-102.15, -74.12), ylim = c(7.65, 33.97), expand = FALSE)


#depth vs magnitude
Eq_SZone_I$depth <- as.numeric(Eq_SZone_I$depth)
ggplot(Eq_SZone_I, aes(x=depth,y=mag)) + 
  geom_point()+
  xlab("Depth")+
  ylab("Magnitude")+
  ggtitle("Magnitude VS Depth plot in zone SZ1")

Eq_SZone_II$depth <- as.numeric(Eq_SZone_II$depth)
ggplot(Eq_SZone_II, aes(x=depth,y=mag)) + 
  geom_point()+
  xlab("Depth")+
  ylab("Magnitude")+
  ggtitle("Magnitude VS Depth plot in zone SZ2")


Eq_SZone_III$depth <- as.numeric(Eq_SZone_III$depth)
ggplot(Eq_SZone_III, aes(x=depth,y=mag)) + 
  geom_point()+
  xlab("Depth")+
  ylab("Magnitude")+
  ggtitle("Magnitude VS Depth plot in zone SZ3")


Eq_SZone_IV$depth <- as.numeric(Eq_SZone_IV$depth)
ggplot(Eq_SZone_IV, aes(x=depth,y=mag)) + 
  geom_point()+
  xlab("Depth")+
  ylab("Magnitude")+
  ggtitle("Magnitude VS Depth plot in zone SZ4")


Eq_SZone_V$depth <- as.numeric(Eq_SZone_V$depth)
ggplot(Eq_SZone_V, aes(x=depth,y=mag)) + 
  geom_point()+
  xlab("Depth")+
  ylab("Magnitude")+
  ggtitle("Magnitude VS Depth plot in zone SZ5")


Eq_SZone_NWH$depth <- as.numeric(Eq_SZone_NWH$depth)
ggplot(Eq_SZone_NWH, aes(x=depth,y=mag)) + 
  geom_point()+
  xlab("Depth")+
  ylab("Magnitude")+
  ggtitle("Magnitude VS Depth plot in zone NWH")

Eq_SZone_total$depth <- as.numeric(Eq_SZone_total$depth)
ggplot(Eq_SZone_total, aes(x=depth,y=mag,color=zone)) + 
  geom_point()+
  xlab("Depth")+
  ylab("Magnitude")+
  ggtitle("Magnitude VS Depth plot in all sz zone")


#time series plot 
library(lubridate)

Eq_SZone_I$date <- paste(Eq_SZone_I$day,"/",Eq_SZone_I$month,"/",Eq_SZone_I$Year)
datatable(Eq_SZone_I)

