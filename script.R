##### DOWNLOAD E IMPORTAÇÃO DE BIBLIOTECAS ####
#Download packages if not installed
list.of.packages <- c("kableExtra","viridis", "ggplot2", "rmdformats", "rmarkdown", "dplyr", "tidyr", "readr", "knitr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

#Import packages from list
lapply(list.of.packages, require, character.only = TRUE)
?kable_styling
##### DOWNLOAD DO DATASET #####

#Dataset Urls e filenames
dataset <- data.frame(
  "url"=c(
    "http://dados.recife.pe.gov.br/dataset/45dbabee-0352-411a-b289-66fccde8942a/resource/5eaed1e8-aa7f-48d7-9512-638f80874870/download/sedec_chamados.csv",   
    "http://dados.recife.pe.gov.br/dataset/45dbabee-0352-411a-b289-66fccde8942a/resource/bb4b8cdb-122b-491a-80f7-b028b66108e1/download/sedec_vistorias.csv",
    "http://dados.recife.pe.gov.br/dataset/45dbabee-0352-411a-b289-66fccde8942a/resource/48dd7535-329c-4a6a-bb2d-f26ebb1ab531/download/sedec_lonas.csv",
    "http://dados.recife.pe.gov.br/dataset/45dbabee-0352-411a-b289-66fccde8942a/resource/fa35d810-b291-4e74-9282-3c4db1aca312/download/sedec_solicitacoes.csv",
    "http://dados.recife.pe.gov.br/dataset/45dbabee-0352-411a-b289-66fccde8942a/resource/7a22d871-250e-419a-9b5a-1cab19db7be5/download/sedec_tipo_ocorrencias.csv"
  ),
  "filename"=c(
    "sedec_chamados.csv",
    "sedec_vistorias.csv",
    "sedec_lonas.csv",
    "sedec_solicitacoes.csv",
    "sedec_tipo_ocorrencias.csv"
  )
) 

#Setting path to current directory "./"
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

#create folders if not exists
dir.create("./dataset")

#Download the dataset files if not exists
for (i in 1:nrow(dataset)) {
  url <- dataset$url[i]
  filepath <- paste("./dataset/", dataset$filename[i], sep='')
  if(!file.exists(filepath)) {
    download.file(url, filepath)
  }
}

##### OPENING DATASET CSVS #####

data_chamados <- read_csv2("./dataset/sedec_chamados.csv")
data_vistorias <- read_csv2("./dataset/sedec_vistorias.csv")
data_lonas <- read_csv2("./dataset/sedec_lonas.csv")
data_solicitacoes <- read_csv2("./dataset/sedec_solicitacoes.csv")
data_tipo_ocorrencias <- read_csv2("./dataset/sedec_tipo_ocorrencias.csv")


#a <- as.factor(data_chamados$solicitacao_bairro)
#a.levels()
#levels(a)
