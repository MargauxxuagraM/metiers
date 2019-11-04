
#'Description :la fonction df_metiers est utlisée pour la construction de la classe comp_met.
#'

#' @param nom1 nom de métier
#' @param nom2 nom de métier
#'
#' @return Data frame issu de ResMetBE17.La variable "pct" permet de mesurer l'importance des régions (en termes de part des projets de recrutement) pour chacun des deux metiers
#' @export
#' @import dplyr
#' @examples
df_metiers=function(nom1,nom2)
{
  

  ResMetBE17%>%
    select(nom_metier,REG,NOM_REG,met)%>%
    dplyr::filter(nom_metier %in% c(nom1,nom2))%>%
    group_by(`nom_metier`,REG,NOM_REG)%>%
    summarise_at(vars(met),funs(sum))%>%
    ungroup()%>%
    group_by(`nom_metier`)%>%
    mutate(pct = prop.table(met) * 100)
}