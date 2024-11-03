library(readxl)
library(SummarizedExperiment)
data <- read_excel("~/MÁSTER/ANÁLISIS DATOS ÓMICOS/PEC1/GastricCancer_NMR.xlsx", sheet = "Data")
peak <- read_excel("~/MÁSTER/ANÁLISIS DATOS ÓMICOS/PEC1/GastricCancer_NMR.xlsx", sheet = "Peak")
assay_data <- as.matrix(data[, grep("^M", names(data))])
se <- SummarizedExperiment(assays = list(counts = assay_data), 
                           colData = peak)
se
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
