programa
{
	// Bibliotecas necessárias para funções utilitárias e manipulação de texto
	inclua biblioteca Util --> u
	inclua biblioteca Texto --> t
	
	funcao inicio() 
	{
		// Variáveis para armazenamento e análise dos números
		inteiro vetor[10]           // Vetor para armazenar os 10 números
		inteiro pares = 0           // Contador de números pares
		inteiro impares = 0         // Contador de números ímpares
		inteiro maior = 0           // Maior número encontrado
		inteiro pos1 = 0            // Posição do maior número
		inteiro menor = 0           // Menor número encontrado
		inteiro pos2 = 0            // Posição do menor número
		inteiro soma = 0            // Soma de todos os números
		real media = 0.0            // Média dos números
		cadeia refazer              // Resposta para refazer a análise
		
		// Solicita os números ao usuário
		limpa()
		escreva("Digite 10 números:\n")
		
		// Loop para ler os números e fazer análise inicial
		para (inteiro posicao = 0; posicao < 10; posicao++)
		{
			escreva((posicao+1), "º número: ")
			leia(vetor[posicao])
			
			// Inicializa maior e menor com o primeiro número
			se (posicao == 0) 
			{
				maior = vetor[posicao]
				menor = vetor[posicao]
				pos1 = posicao
				pos2 = posicao
			}
			
			// Atualiza maior número se necessário
			se (vetor[posicao] > maior) 
			{
				maior = vetor[posicao]
				pos1 = posicao
			}
			
			// Atualiza menor número se necessário
			se (vetor[posicao] < menor) 
			{
				menor = vetor[posicao]
				pos2 = posicao
			}
			
			// Conta números pares e ímpares
			se (vetor[posicao] % 2 == 0) 
			{
				pares++
			} 
			senao 
			{
				impares++
			}
			
			// Acumula a soma
			soma += vetor[posicao]
		}
		
		// Calcula a média
		media = (soma * 1.0) / 10
		limpa()
		
		// Exibe o vetor com indicação de par/ímpar
		escreva("Vetor na ordem original:\n")
		para (inteiro posicao = 0; posicao < 10; posicao++)
		{
			escreva((posicao+1), "º número -> ", vetor[posicao])
			se (vetor[posicao] % 2 == 0) 
			{
				escreva(" (par)")
			} 
			senao 
			{
				escreva(" (ímpar)")
			}
			escreva("\n")
		}
		
		// Exibe o resumo das análises
		escreva("\nResumo das informações obtidas:\n")
		escreva("Quantidade de nº pares: ", pares, "\n")
		escreva("Quantidade de nº ímpares: ", impares, "\n")
		escreva("O maior nº informado foi o ", maior, " na posição ", (pos1+1), "\n")
		escreva("O menor nº informado foi o ", menor, " na posição ", (pos2+1), "\n")
		escreva("A somatória de todos os nº é ", soma, "\n")
		escreva("A média aritmética é: ", media, "\n")
		
		// Pergunta se quer refazer
		escreva("\nVocê deseja refazer? [s/n] ")
		leia(refazer)
		se (refazer == "sim" ou refazer == "s") 
		{
			limpa()
			inicio()
		}
	}
}