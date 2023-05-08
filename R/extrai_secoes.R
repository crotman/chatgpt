

extrai_secoes <- function(arquivo = "pdfs/22.pdf"){
    
    texto <- tabulizer::extract_text(file = arquivo) 
    
    linhas_texto <- texto |> 
        enframe(
            value = "texto"
        ) |> 
        unnest_lines(
            input = texto,
            output = "linha"
        )

    candidatos_secao <- linhas_texto |> 
        filter(
            str_detect(
                linha,
                "^[0-9iv][iv \\.]+[ \\.] ?[a-z]"
            )
        ) |>
        rowwise() |> 
        mutate(
            n = str_length(linha)
        ) |> 
        filter(
            n < 80
        ) |>
        mutate(
            num = str_extract(linha, pattern = "^[0-9iv][iv \\.]+ " ) 
        )

    
}

