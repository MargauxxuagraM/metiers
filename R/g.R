#' Title
#'Description:la fonction f est utlisée pour la construction de la classe comp_reg
#' @param d 
#' @param nom1 nom de région
#' @param nom2 nom de région
#' @param nb nombre de métiers sélectionnés dans chaque région. Le critère de sélection
#' est le pourcentage de projets de recrutement.
#'
#' @return Data frame issu de ResMetBE17
#' @export
#'
#' @examples
g<-function(d,nom1,nom2,nb){
  
  
  
  
  
  d1=filter(d,NOM_REG==nom1)
  d1=d1[order(d1$pct,decreasing = TRUE),]
  d1=head(d1,nb)
  
  d2=filter(d,NOM_REG==nom2)
  d2=d2[order(d2$pct,decreasing = TRUE),]
  d2=head(d2,nb)
  print(rbind(d1,d2))
  
}