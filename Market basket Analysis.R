install.packages("arules")
require(arules)
Groc<- read.transactions("Groceries Original data.csv", sep=",")
Groc
summary(Groc)
#Here the density is given as 0.2609146 which is total number of items bought/total number of cells
# So lets find out total number of items bought
9835*169 #(No of rows* no of coulms gives us the total number of cells)
9835*169*0.2609146 #Gives us the number of items bought

itemFrequency(Groc) # gets the frequency of each item

itemFrequencyPlot(Groc,support= 0.10) # gets the frequency of each item that has 10% or more support
itemFrequencyPlot(Groc, topN=5) # gets the frequency of each top 5 items
#Gives us the items with support 7% and confidence 25%
m1 <- apriori(Groc,parameter=list(support=0.007, confidence=0.25, minlen=2)
)
m1
#Gives summary of m1
summary(m1)
#to see the rules of m1 from item 1 to 4
inspect(m1[1:4])
#"Lift" is the how likely an item is purchased so ordering it from top, that is first 4 items
inspect(sort(m1, by="lift")[1:4])