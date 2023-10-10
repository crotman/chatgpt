

library(tidyverse)
library(openai)


ja_lidos <- list.files("classificacao_nova") |> 
    enframe()


arquivos <- list.files("resumos") |> 
    enframe(
    ) |> 
    rowwise() |> 
    mutate(
        resumo =  read_lines("resumos/{value}" |> str_glue()) |> 
            str_flatten(
                collapse = "\n"
            )
    ) |>
    ungroup() |> 
    anti_join(
        ja_lidos,
        by = join_by(value == value)
    ) 


classifica_paper_possibily = possibly(
    .f = classifica_paper, 
    otherwise = "This part could not be summarised", 
    quiet = FALSE 
)



walk2(
    .x = arquivos$resumo,
    .y = arquivos$value,
    .f = classifica_paper_possibily,
    .progress = TRUE
)



