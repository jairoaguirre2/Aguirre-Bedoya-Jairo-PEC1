library(readxl)
library(SummarizedExperiment)
data <- read_excel("~/MÁSTER/ANÁLISIS DATOS ÓMICOS/PEC1/GastricCancer_NMR.xlsx", sheet = "Data")
peak <- read_excel("~/MÁSTER/ANÁLISIS DATOS ÓMICOS/PEC1/GastricCancer_NMR.xlsx", sheet = "Peak")
assay_data <- as.matrix(data[, grep("^M", names(data))])
row_data <- data[, c("Idx", "SampleID", "SampleType", "Class")]
se <- SummarizedExperiment(assays = list(counts = assay_data), 
                             rowData = row_data,
                             colData = peak)

se
class(colData(se))
head(colData(se))
summary(colData(se))
class(assay(se))
head(assay(se))
head(rowData(se))
colData(se)[1, ]
colData(se)[6, ]
hist(peak$Perc_missing, main="Distribución de Datos Faltantes", 
     xlab="Porcentaje de Datos Faltantes", 
     ylab="Frecuencia", col="pink")
boxplot(peak$QC_RSD, main="Distribución de QC_RSD", 
        ylab="RSD (%)", col="violet")
save(se, file = "dataset_metabolomica.Rda")
# Exportar matriz de datos, metadatos e información de las variables 
write.csv(assay(se), file = "assay_data.csv", row.names = TRUE)
write.csv(colData(se), file = "colData.csv", row.names = TRUE)
write.csv(rowData(se), file = "rowData.csv", row.names = TRUE)

