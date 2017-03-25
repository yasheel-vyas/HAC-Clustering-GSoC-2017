library(rioja)
#importing the downloaded dataset
dissimilarity <- read.csv("C:/Users/Yasheel Vyas/Downloads/dissimilarity.txt", sep="")
View(dissimilarity)


#converting the dataset into distance matrix type

dissimilarity=as.dist(dissimilarity)
#jpeg('dendrogram.jpg')     #to save plot output


#diss=dist(dissimilarity,method='canberra')


#clust1=chclust(dissimilarity,method = "coniss")     #To plot the dendogram using coniss method

clust1=chclust(dissimilarity,method = "conslink")    #To plot the dendogram using conslink method

plot(clust1,hang=-1)
  
#dev.off()           

#creating the hclust object to implement hierarchial clustering

hc = hclust(dissimilarity, method = 'ward.D')

y_hc = cutree(hc,6)

dissimilarity=as.matrix(dissimilarity) #To convert dissimilarity into a data matrix  



# Visualising the clusters
#jpeg('HAC.jpg')
library(cluster)
clusplot(dissimilarity,
         y_hc,
         lines = 0,
         shade = FALSE,
         color = TRUE,
         labels= 5,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters'),
        diss=TRUE,
        
)
#dev.off()