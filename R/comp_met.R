#' La fonction comp_met  crée un data frame qui permet de comparer deux métiers à
#' l'aide de la part des projets de recrutement qu'ils occupent dans chaque région.

#' @param metier1 nom de métier
#' @param metier2 nom de métier
#'
#' @return
#' @export
#'
#' @examples
comp_met=function(metier1,metier2)
 
  
# constructeur de la classe comp_met
{obj=list(df=df_metiers(metier1,metier2),nom1=metier1,nom2=metier2)
class(obj)="comp_met"
obj
}