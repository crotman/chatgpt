

extrai_cabecalho_rodape <- function(arquivo = "pdfs/18.pdf"){
    
    texto <- tabulizer::extract_text(file = arquivo) 

    linhas_texto <- texto |> 
        enframe(
            value = "texto"
        ) |> 
        unnest_lines(
            input = texto,
            output = "linha", 
        ) |> 
        mutate(
            id_linha = row_number()
        ) |> 
        rowwise() |> 
        mutate(
            linha = str_remove_all(linha, "[0-9]") |> str_trim()
        ) |> 
        ungroup()
    
    linhas_repetindo <- linhas_texto |> 
        summarise(
            n = n(),
            ids = list(id_linha),
            .by = linha
        )
    
}