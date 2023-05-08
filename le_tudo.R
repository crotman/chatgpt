

library(tidyverse)
library(tidytext)
library(openai)

source("R/extrai_partes_para_chat.R")
source("R/resume_paper.R")
source("R/resume_parte.R")

arquivos_existentes <- list.files(
    path = "resumos-pdfs",
    full.names = TRUE,
    pattern = "*_sem_guia.txt"
)  |> 
    enframe() |> 
    mutate(
        numero = str_extract(value, "[0-9]+")
    )

arquivos <- list.files(
    path = "pdfs",
    full.names = TRUE,
    pattern = "*.pdf"
)  |> 
    enframe() |> 
    mutate(
        numero = str_extract(value, "[0-9]+")
    ) |> 
    anti_join(
        arquivos_existentes,
        by = join_by(numero)
    )

resumo <- map(
    .x = arquivos$value,
    .f = resume_paper,
    .progress = TRUE
)


