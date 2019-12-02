getwd()
setwd("C:\\Users\\USER\\Downloads\\DATA SCIENCE\\R Programming\\Section 6 GGPlot2")

# import data
movies <- read.csv("P2-Movie-Ratings.csv")
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")

# explore data
head(movies)
str(movies) # Factor -> categorical variable
summary(movies)

# ubah year dari int jadi factor
movies$Year <- factor(movies$Year)
str(movies)



# AESTHETICS
library(ggplot2)

ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))

# add geometry
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating)) +
  geom_point()

# add color
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre)) +
  geom_point()

# add size
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre, size = BudgetMillions)) +
  geom_point()



# PLOTTING WITH LAYERS
plot <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, 
                                  color = Genre, size = BudgetMillions))

# point
plot + geom_point()
# line
plot + geom_line()
# multiple layers
plot + geom_point() + geom_line()
plot + geom_line() + geom_point()



# OVERRIDING AES
# ex 1
plot + geom_point(aes(size = CriticRating))
# ex 2
plot + geom_point(aes(color = I("blue")))
# ex 3
plot + geom_point(aes(x = BudgetMillions)) +
  xlab("Budget Millions") # aes in geom_point doesn't change xlab
# ex 4
plot + geom_line(size = 1) + geom_point(size = 1) # size=1 is a SETTING, not MAPPING



# MAPPING VS SETTING
plot2 <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))
plot2 + geom_point()

# add color by mapping
plot2 + geom_point(aes(color = Genre))
# add color by setting
plot2 + geom_point(color = "blue")

# change size by mapping
plot2 + geom_point(aes(size = BudgetMillions))
# change size by setting
plot2 + geom_point(size = 5)



# HISTOGRAM
s <- ggplot(data = movies, aes(x = BudgetMillions))
s + geom_histogram(binwidth = 10) # binwidth = range for x coordinate

# add fill
s + geom_histogram(binwidth = 10, aes(fill = Genre)) # color: dot and line VS fill: inside
# add border
s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black")

# DENSITY CHART
s + geom_density(aes(fill = Genre))
s + geom_density(aes(fill = Genre), position = "stack")



# STARTING LAYER
# method 1: global aes
t <- ggplot(data = movies, aes(x = AudienceRating))
t + geom_histogram(binwidth = 10,
                   fill = "white",
                   color = "blue")

# method 2: local aes only for histogram, more flexible
t <- ggplot(data = movies)
t + geom_histogram(aes(x = AudienceRating),
                   binwidth = 10,
                   fill = "white",
                   color = "blue")


t <- ggplot(data = movies)
t + geom_histogram(aes(x = CriticRating),
                   binwidth = 10,
                   fill = "white",
                   color = "blue")

# method 3: skeleton plot
t <- ggplot()
t + geom_histogram(data = movies,
                   aes(x = AudienceRating),
                   binwidth = 10,
                   fill = "white",
                   color = "blue")



# STATISTICAL TRANSFORMATION
# geom_smooth
u <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre))
u + geom_point() + geom_smooth(fill = NA)

# boxplot
u <- ggplot(data = movies, aes(x = Genre, y = AudienceRating, color = Genre))
u + geom_boxplot(size = 1.1)
u + geom_boxplot(size = 1.1) + geom_point() # numpuk, tdk keliatan, solusi:
u + geom_boxplot(size = 1.1) + geom_jitter()
u + geom_jitter() + geom_boxplot(size = 1.1, alpha = 0.5) 



# FACET
# ex 1
v <- ggplot(data = movies, aes(x = BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black")

v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") +
  facet_grid(Genre ~ ., scales = "free") # row ~ column

# ex 2
w <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre))

w + geom_point(size = 2) +
  facet_grid(Genre ~ .)

w + geom_point(size = 2) +
  facet_grid(~ Year)

w + geom_point(size = 2) +
  facet_grid(Genre ~ Year)

w + geom_point(size = 2) +
  geom_smooth() + facet_grid(Genre ~ Year)

w + geom_point(aes(size = BudgetMillions)) + 
  geom_smooth() + facet_grid(Genre ~ Year)



# COORDINATES (ZOOM IN/OUT)
plot + geom_point() +
  xlim(50, 100) +
  ylim(50, 100)

# using limit doesn't always functioning, the histogram is cropped
n <- ggplot(data = movies, aes(x = BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") +
  ylim(0, 50)

# alternatively, use zoom
n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") +
  coord_cartesian(ylim = c(0, 50))

# improved
w + geom_point(aes(size = BudgetMillions)) + 
  geom_smooth() + facet_grid(Genre ~ Year) +
  coord_cartesian(ylim = c(0, 100))




# THEME
o <- ggplot(data = movies, aes(x = BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black")

# label formatting
h + 
  xlab("Budget (in Millions)") +
  ylab("No. of Movies") +
  theme(axis.title.x = element_text(color = "blue", size = 15),
        axis.title.y = element_text(color = "red", size = 15))

# tick formatting
h + 
  xlab("Budget (in Millions)") +
  ylab("No. of Movies") +
  theme(axis.title.x = element_text(color = "blue", size = 15),
        axis.title.y = element_text(color = "red", size = 15),
        axis.text = element_text(size = 15))

# legend formatting
h + 
  xlab("Budget (in Millions)") +
  ylab("No. of Movies") +
  theme(axis.title.x = element_text(color = "blue", size = 15),
        axis.title.y = element_text(color = "red", size = 15),
        axis.text = element_text(size = 15),
        legend.title = element_text(size = 15),
        legend.text = element_text(size = 12),
        legend.position = c(1,1),
        legend.justification = c(1,1)) # 1,1 -> right top

library(extrafont)
font_import()

# title
h + 
  xlab("Budget (in Millions)") +
  ylab("No. of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color = "blue", size = 15),
        axis.title.y = element_text(color = "red", size = 15),
        axis.text = element_text(size = 15),
        legend.title = element_text(size = 15),
        legend.text = element_text(size = 12),
        legend.position = c(1,1),
        legend.justification = c(1,1), # 1,1 -> right top
        plot.title = element_text(color = "green",
                                  size = 30))


# ADDITIONAL
# FACET WRAP VS GRID
g <- ggplot(mpg, aes(displ, hwy))
g + geom_point(alpha=1/3) + facet_grid(cyl~class) # 4*7 = 28 plots
g + geom_point(alpha=1/3) + facet_wrap(cyl~class) # 28-9 = 19 plots, where 9 plots are empty plots
