
df <- read.table("/Users/prtimilsina/Documents/all/all/Myhet_paper/chlorophyll_bios_genes.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)


library(dplyr)
library(ggplot2)
library(reshape2)


View(df)
#dfm <- select(df, gene_name, Croomia, Triuris, Lacandonia, Burmannia, Gymnosiphon)
dfm <- melt(df, id.vars=c("stage", "gene_name"), na.rm=T)
View(dfm)
dfm$gene_name <- factor(dfm$gene_name, levels = dfm$gene_name)
#dfm$stage <- factor(dfm$stage, levels=dfm$stage)

gplot <- ggplot(dfm, aes(x = gene_name, y = value, fill = variable)) +
          geom_bar(stat = "identity", position = position_dodge(width = 0.8)) +
       labs( x = " ", y = "Expression level (TPM)", fill = "Taxa")

        
gplot + 
        coord_cartesian(ylim=c(0,500)) +
        theme(axis.text.x = element_text(angle = 60, hjust = 1, vjust = 0.95, size = 12),
              axis.title.y = element_text(colour="Black", size=14, vjust = 0.5),
              axis.text.y = element_text(size=14),
              
              legend.title=element_text(size=10),
              legend.text=element_text(size=10),
              legend.position=c(1,1),
              legend.justification=c(1,1),
              plot.title=element_text(colour="Maroon", size=30,
                                      family="Courier")) 
        
        