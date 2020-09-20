library(ggplot2)
file = "data.csv"
data = read.csv(file)

crossSectionalArea = 0.0001267 #in m^2
original_length = 50.8
load = data[1]

    


## Load vs Elongation
# aes takes the results of names(dataframe) but not in string
elongation = data[2] - original_length
names(elongation) = "dGap"
load_elong_data = data.frame(load, elongation)

load_elong_graph = ggplot(data=load_elong_data, aes( y=Load , x=dGap)) +
    geom_line(stat="identity")+
    ylab("Load (N)") +
    xlab("Elongation (mm)") +
    labs(title = "Load vs Elongation")
load_elong_graph

## Stress vs Strain
stress = load / crossSectionalArea / 1000000 # Load / cross_sectional_area in MPa
strain = elongation / original_length #dLen/OrgLen
stress_strain_data = data.frame(stress, strain)
names(stress_strain_data) = c("stress", "strain")

stress_strain_graph = ggplot(data=stress_strain_data, aes( x=strain , y=stress)) +
    geom_line(stat="identity")+
    xlab("Strain (mm/mm)") +
    ylab("Stress MPa (N/m^2)") +
    labs(title = "Stress vs Strain")+
    coord_cartesian(xlim = c(0, 0.005)) #Question C
stress_strain_graph

## Young's Modulus
slopes = stress / strain
slopes[is.na(slopes)] = 0
young_mod_data = data.frame(slopes)
names(young_mod_data) = c("slopes")
len = length(young_mod_data$slopes)

young_mod_data$diff = c(young_mod_data$slopes[1:len-1] - young_mod_data$slopes[2:len], 0) #Add a zero at the end
index = which.max(young_mod_data$diff) 
young_mod = stress[index,1] / strain[index,1]

## Print material properties
cat("Young's Modulud: ", young_mod)
cat("Yeild Strength: ", stress[index,])
cat("Tensile Strenth: ", max(stress))

## Percent Elongation at Failure
# TODO this returns a list, I took a shortcut
percent_elongation = elongation[nrow(elongation),] / original_length * 100
cat("Percent Elongation at Failure: ", max(percent_elongation), "\b%")
