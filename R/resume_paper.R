
resume_paper <- function(arquivo){
    

    print(arquivo)
    
    Sys.sleep(0.5)
    
    
    resume_parte_possibily = possibly(
        .f = resume_parte, 
        otherwise = "This part could not be summarised", 
        quiet = FALSE 
    )
    
    
    resume_parte_sem_guia_possibily = possibly(
        .f = resume_parte_sem_guia, 
        otherwise = "This part could not be summarised", 
        quiet = FALSE 
    )
    
    
    resumos <- extrai_partes_para_chat(arquivo) |> 
        mutate(
            n_tokens = 2000/n() |>  as.integer()
        ) |> 
        rowwise() |> 
        mutate(
            resumo = resume_parte_possibily(
                texto,
                n_tokens
            )
        ) |> 
        mutate(
            resumo_sem_guia = resume_parte_sem_guia_possibily(
                texto,
                n_tokens
            )
        )
    
    resumo <- str_flatten(resumos$resumo, "\n\n")

    resumo_sem_guia <- str_flatten(resumos$resumo_sem_guia, "\n\n")
    
    endereco_pre <- str_extract(arquivo, "[0-9]+")
    
    endereco <- "resumos-pdfs/{endereco_pre}.txt" |> str_glue()

    endereco_sem_guia <- "resumos-pdfs/{endereco_pre}_sem_guia.txt" |> str_glue()
    
    write_lines(resumo, endereco)
    
    write_lines(resumo_sem_guia, endereco_sem_guia)
    

}

