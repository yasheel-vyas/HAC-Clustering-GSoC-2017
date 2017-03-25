#library(devtools)
#install_github("pneuvial/adjclust")
d = as.matrix(dissimilarity2)
d = d^2
n = nrow(d)
rs = rowSums(d)
rs = as.vector(rs)
ts = sum(rs)
cs = colSums(d)
cs = as.vector(cs)
s = matrix(,nrow=n,ncol=n)
for(i in 1:n) {
  for(j in 1:n) {
    s[i,j] = -(d[i,j]-rs[i]/n-cs[j]/n+ts/(n**2))/2
  }
}
s2 = matrix(,nrow=n,ncol=n)
for(i in 1:n) {
  for(j in 1:n) {
    s2[i,j] =s[i,j]/sqrt(s[i,i])/sqrt(s[j,j])
  }
}

#s=as.dist(s)
p<-ncol(s)

convert_Hclust<-function(i, k){
  x=band(i,1,k)
  x=as(x,"sparseMatrix")
  
  fit <- adjclust:::adjClustBand_heap(x@x, p, k  , blMin=1)
  return(fit)
}
h=5
fit2=convert_Hclust(s2,h)
plot(fit2)
