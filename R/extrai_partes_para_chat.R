
extrai_partes_para_chat <- function(arquivo = "pdfs/18.pdf"){

    texto <- tabulizer::extract_text(file = arquivo) 
    
    partes <- texto |> 
        enframe(
            value = "texto"
        ) |> 
        unnest_sentences(
            input = texto,
            output = "frase"
        ) |> 
        mutate(
            id_frase = row_number()
        ) |> 
        unnest_tokens(
            output = "palavra",
            input = "frase",
            drop = FALSE
        ) |> 
        summarise(
            .by = -palavra,
            n_tokens = n()
        ) |> 
        mutate(
            tamanho_cum = cumsum(n_tokens)
        ) |> 
        mutate(
            parte = tamanho_cum %/% 1200
        ) |> 
        summarise(
            .by = parte,
            texto = str_flatten(frase, collapse = " " )
                
        )
        
    
    partes    
    
}
