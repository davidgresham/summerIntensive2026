#myDogAnlaysis.R

#read in the dog weight file

dog_weights <- read.csv("data/dog_weights.csv")

#make a boxplot separating values by breed

boxplot(dog_weights$dog_weight ~ dog_weights$dog_type)

#color each box a different color

boxplot(dog_weights$dog_weight ~ dog_weights$dog_type, col = c("red", "green", "pink"))

#add a title, y axis and legend

boxplot(dog_weights$dog_weight ~ dog_weights$dog_type, 
        col = c("red", "green", "pink"), 
        main = "Dog weights (pounds)",
        ylab = "weight (lbs)",
        xlab = "Dog breed",
        cex.lab = 2,
        cex.main = 3
        )

#save it as a pdf

pdf("dog_weights.pdf", width = 4, height = 4)

boxplot(dog_weights$dog_weight ~ dog_weights$dog_type, 
        col = c("red", "green", "pink"), 
        main = "Dog weights (pounds)",
        ylab = "weight (lbs)",
        xlab = "Dog breed",
        cex.lab = 1.3,
        cex.main = 1.5
)

dev.off()

#select beagles

library(dplyr)

dog_weights |>
  filter(dog_type == "beagle") |>
  summarise(mean_weight = mean(dog_weight))


dog_weights |>
  filter(dog_type == "beagle")
beagles <- dog_weights |>
  filter(dog_type == "beagle")

beagles
t.test(beagles$dog_weight)
t.test(beagles$dog_weight, mu = 21)
