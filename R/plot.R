plot.comp_reg=function(obj){

#' Title
#' Description : Méthode plot de la classe comp_reg. Le graphique permet de comparer deux régions à
#' l'aide des métiers qui y font l'objet du plus grand nombre de projets de recrutement.
#' @param obj objet de classe comp_reg
#'
#' @return diagrammes en barres.
#' @imports ggplot2
#'
#' @examples

  

  obj$df=select(obj$df,c("NOM_REG","nom_metier","pct"))
  obj$df[["NOM_REG"]]<- as.factor(obj$df[["NOM_REG"]])
  obj$df[["nom_metier"]]<- as.factor(obj$df[["nom_metier"]])
  
  ggplot(data=obj$df, aes(x=NOM_REG , y=pct,fill=nom_metier)) +
    geom_bar(stat="identity",position=position_dodge()) +
    coord_flip()+
    #ggtitle( paste("les métiers les plus accessibles en ", obj$reg1,"et", obj$reg2, "sont:",sep=" ") ) 
    labs(title = paste("les métiers les plus accessibles en ", obj$reg1,"et", obj$reg2, "sont:",sep=" "),
         y="pourcentage",x="nom des régions")
  
}






plot.comp_met=function(obj){
  
  #' Title
  #' Description : Méthode plot de la classe comp_met. Le graphique permet de comparer deux métier à
  #' l'aide de la part des projets de recrutement qu'ils occupent dans chaque région
  #' @param obj objet de classe comp_met
  #'
  #' @return diagrammes en barres.
  #' @import ggplot2
  #'
  #' @examples
  obj$df%>% 
    ggplot(aes(x=reorder(NOM_REG,pct), y = pct,fill=`nom_metier`))+ 
    geom_bar(stat = 'identity',position = "dodge")+ 
    geom_text(aes(y = pct -1.5 ,  
                  label = paste0(round(pct,1), '%')),   
              position = position_dodge(width = .9), 
              size = 3,
              color="#FFFFFF")+
    coord_flip()+
    labs(title="Les métiers qui m'intéressent le plus",
         x='',
         y='%')+
    scale_fill_manual(values=c("orange", "purple"), 
                      name="",
                      labels=c(obj$nom1,obj$nom2))+
    theme(legend.position="top")
  

}