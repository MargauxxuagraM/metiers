comp_reg <-function(region1,region2){
  
#' La fonction Comp_reg crée un data frame qui permet de comparer deux régions à
#' l'aide des métiers qui y font l'objet du plus grand nombre de projets de recrutement.
#' @param region1 nom de région 
#' @param region2 nom de région
#'
#' @return objet de classe comp_region
#' @export
#' @import ggplot2
#' @examples
#' 
#' @import dplyr

  
  
  
obj<-list(df=g(d=f(region1,region2),nom1=region1,nom2=region2,nb=5),reg1=region1,reg2=region2)
class(obj)=c("comp_reg")
obj
}
