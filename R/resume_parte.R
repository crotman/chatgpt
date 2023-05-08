



resume_parte_sem_guia <- function(parte = teste$texto[4], n_tokens = 1000/6){
    
    print("resumindo")
    
    browser()
    
    resposta <- create_chat_completion(
        model = "gpt-3.5-turbo",
        temperature = 0,
        messages = list(
            list(
                "role" = "system",
                "content" = "Submeto a você uma parte de um paper. 
                Resuma esta parte do paper em {n_tokens} tokens em inglês.
                {parte}
                " |> str_glue()
            )
        ),
        
    )
    
    
    resposta$choices$message.content
    
}

resume_parte <- function(parte = teste$texto[4], n_tokens = 1000/6){
    
    print("resumindo")

    resposta <- create_chat_completion(
        model = "gpt-3.5-turbo",
        temperature = 0,
        messages = list(
            list(
                "role" = "system",
                "content" = "Submeto a você uma parte de um paper. 
                Resuma esta parte do paper em {n_tokens} tokens.
                Gere o resumo em inglês. 
                Não inclua informações de papers referenciados. Ignore a parte do texto em que há apenas títulos e autores de outros papers
                Enfatize 5 pontos:
                1 - A aplicação das metodologias descritas neste paper no processo de desenvolvimento de software
                2 - O problema de engenharia e desenvolvimento de software está sendo estudado com uso da teoria dos jogos
                3 - O método dentro da disciplina de 'Teoria dos Jogos' ou 'Game Theory' é utilizado 
                4 - O jogo descrito no paper, os participantes ou jogadoes, os payoffs, as ações possíveis para cada jogador. 
                5 - Os resultados
                Se não houver discussão sobre algum dos 5 pontos, não fale sobre o ponto, pois esta descrição pode estar em outra parte do paper
                Segue a parte a resumir
                {parte}
                " |> str_glue()
            )
        ),
        
    )
    

    resposta$choices$message.content

}