#'
#'Description: la fonction f est utlisée pour la construction de la classe comp_reg.
#' @param nom1 nom d'une région
#' @param nom2 nom d'une région
#'
#' @return Data frame issu de ResMetBE17.La variable "pct" permet de mesurer l'importance des métiers dans chacune des deux régions (en termes de part des projets de recrutement)
#' @export
#'
#' @examples
f<-function(nom1,nom2){
  
  
  
  ResMetBE17 %>%
    select(nom_metier,REG,NOM_REG,met)%>%
    dplyr::filter(NOM_REG %in% c(nom1,nom2))%>%
    group_by(nom_metier,NOM_REG)%>%
    summarise_at(vars(met),funs(sum))%>%
    ungroup()%>%
    group_by(`NOM_REG`)%>%
    mutate(pct = prop.table(met) * 100)
  
}