
resume_paper <- function(arquivo){
    
    browser()
    
    print(arquivo)
    
    Sys.sleep(0.5)
    
    resumos <- extrai_partes_para_chat(arquivo) |> 
        mutate(
            n_tokens = 1200/n() |>  as.integer()
        ) |> 
        rowwise() |> 
        mutate(
            resumo = resume_parte(
                texto,
                n_tokens
            )
        ) |> 
        mutate(
            resumo_sem_guia = resume_parte_sem_guia(
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

