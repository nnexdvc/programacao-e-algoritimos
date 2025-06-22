programa 
{
	// sortear os nomes classificando-os em primeiro, segundo, terceiro, etc
	// adicionar limpa()
	inclua biblioteca Util --> u
	
	funcao inicio() 
	{
		cadeia nomes[100]
		inteiro totalNomes = 0
		inteiro opcao
		cadeia nomeTemp
		logico nomeExiste
		
		limpa()
		escreva("=== SORTEIO DE NOMES===\n")
		
		faca 
		{
			escreva("\n--- MENU ---\n")
			escreva("1. Adicionar participante\n")
			escreva("2. Listar participantes\n")
			escreva("3. Realizar sorteio completo\n")
			escreva("4. Sair\n")
			escreva("Escolha uma opção: ")
			leia(opcao)
			
			escolha(opcao) 
			{
				caso 1:
					se(totalNomes < 100) 
					{
						escreva("Digite o nome do participante: ")
						leia(nomeTemp)
						
						nomeExiste = falso
						para(inteiro i = 0; i < totalNomes; i++) 
						{
							se(nomes[i] == nomeTemp) 
							{
								nomeExiste = verdadeiro
								pare
							}
						}
						
						se(nomeExiste) 
						{
							limpa()
							escreva("ERRO: Este nome já foi cadastrado!\n")
						} 
						senao 
						{
							nomes[totalNomes] = nomeTemp
							totalNomes++
							limpa()
							escreva("Participante adicionado com sucesso!\n")
						}
					} 
					senao 
					{
						escreva("Limite máximo de participantes atingido!\n")
					}
					pare
					
				caso 2:
					se(totalNomes == 0) 
					{
						escreva("Nenhum participante cadastrado.\n")
					} 
					senao 
					{
						limpa()
						escreva("\n=== LISTA DE PARTICIPANTES ===\n")
						para(inteiro i = 0; i < totalNomes; i++) 
						{
							escreva((i + 1) + ". " + nomes[i] + "\n")
						}
						escreva("Total de participantes: " + totalNomes + "\n")
						
						escreva("\n--- VISUALIZAÇÃO DO VETOR ---\n")
						escreva("Índices: ")
						para(inteiro i = 0; i < totalNomes; i++) 
						{
							escreva("[" + i + "] ")
						}
						escreva("\nNomes:   ")
						para(inteiro i = 0; i < totalNomes; i++) 
						{
							escreva("[" + nomes[i] + "] ")
						}
						escreva("\n")
					}
					pare
				
				caso 3:
					se(totalNomes == 0) 
					{
						escreva("Não há participantes para sortear!\n")
					} 
					senao se(totalNomes == 1) 
					{
						limpa()
						escreva("Há apenas um participante: " + nomes[0] + "\n")
						escreva("Sorteio realizado automaticamente!\n")
						escreva("1º LUGAR: " + nomes[0] + "\n")
					} 
					senao 
					{
						// Criar cópia do vetor para não alterar o original
						cadeia nomesSorteio[100]
						inteiro totalSorteio = totalNomes
						
						// Copiar nomes para o vetor de sorteio
						para(inteiro i = 0; i < totalNomes; i++)
						{
							nomesSorteio[i] = nomes[i]
						}
						
						limpa()
						escreva("Realizando sorteio completo...\n")
						escreva("\n=== RESULTADO DO SORTEIO ===\n")
						
						// Sortear todos os nomes em ordem de classificação
						para(inteiro posicao = 1; posicao <= totalNomes; posicao++)
						{
							inteiro indiceSorteado
							cadeia nomeSorteado
							
							// Se só resta um nome, não precisa sortear
							se(totalSorteio == 1)
							{
								indiceSorteado = 0
								nomeSorteado = nomesSorteio[0]
							}
							senao
							{
								indiceSorteado = u.sorteia(0, totalSorteio - 1)
								nomeSorteado = nomesSorteio[indiceSorteado]
							}
							
							escreva(posicao + "º LUGAR: " + nomeSorteado + "\n")
							
							// Remover o nome sorteado do vetor (deslocar elementos)
							para(inteiro j = indiceSorteado; j < totalSorteio - 1; j++)
							{
								nomesSorteio[j] = nomesSorteio[j + 1]
							}
							totalSorteio--
						}
						
						escreva("\nSorteio concluído!\n")
						
						cadeia continuar
						escreva("\nPressione ENTER para continuar...")
						leia(continuar)
					}
					pare
					
				caso 4:
					escreva("Encerrando programa...\n")
					escreva("Obrigado por usar o programa!\n")
					pare
				
				caso contrario:
					escreva("Opção inválida! Tente novamente.\n")
					pare
			}
		
		} enquanto(opcao != 4)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 945; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */