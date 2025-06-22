programa
{
	// O Bubble Sort compara elementos adjacentes e os troca
	// se estiverem na ordem incorreta. Este processo é
	// repetido até que nenhuma troca seja necessária.
	// Complexidade: O(n²) no pior caso.
	// Nome: 'Bubble' porque os menores elementos 'borbulham'
	// para o início (ou maiores para o fim).
	funcao inicio()
	{
		inteiro tamanho = 0, i, j, temp, opcao = 0, k
		inteiro vetor[100]
		logico continuar = verdadeiro
		
		escreva("===========================================\n")
		escreva("    ALGORITMO DE ORDENAÇÃO BUBBLE SORT    \n")
		escreva("===========================================\n\n")
		
		enquanto (continuar)
		{
			escreva("Digite a quantidade de números a serem ordenados (máximo 100): ")
			leia(tamanho)
			
			se (tamanho > 0 e tamanho <= 100)
			{
				continuar = falso
			}
			senao
			{
				escreva("ERRO: Digite um número entre 1 e 100!\n\n")
			}
		}
		
		escreva("\n--- ENTRADA DE DADOS ---\n")
		para (i = 0; i < tamanho; i++)
		{
			escreva("Digite o ", i + 1, "º número: ")
			leia(vetor[i])
		}
		
		escreva("\n--- VETOR ORIGINAL ---\n")
		escreva("Números inseridos: [")
		para (i = 0; i < tamanho; i++)
		{
			escreva(vetor[i])
			se (i < tamanho - 1)
			{
				escreva(", ")
			}
		}
		escreva("]\n\n")
		
		continuar = verdadeiro
		enquanto (continuar)
		{
			escreva("--- ESCOLHA DA ORDEM ---\n")
			escreva("[1] Ordem CRESCENTE (menor para maior)\n")
			escreva("[2] Ordem DECRESCENTE (maior para menor)\n")
			escreva("Escolha uma opção (1 ou 2): ")
			leia(opcao)
			
			se (opcao == 1 ou opcao == 2)
			{
				continuar = falso
			}
			senao
			{
				escreva("ERRO: Digite apenas 1 ou 2!\n\n")
			}
		}
		
		limpa()
		escreva("Aplicando o algoritmo de ordenação...\n\n")
		
		// Loop principal do Bubble Sort
		para (i = 0; i < tamanho - 1; i++)
		{
			// Loop interno para comparações adjacentes
			para (j = 0; j < tamanho - i - 1; j++)
			{
				// Condição de troca baseada na ordem escolhida
				logico deve_trocar = falso
				
				se (opcao == 1) // Ordem crescente
				{
					se (vetor[j] > vetor[j + 1])
					{
						deve_trocar = verdadeiro
					}
				}
				senao // Ordem decrescente
				{
					se (vetor[j] < vetor[j + 1])
					{
						deve_trocar = verdadeiro
					}
				}
				
				// Realiza a troca se necessário
				se (deve_trocar)
				{
					temp = vetor[j]
					vetor[j] = vetor[j + 1]
					vetor[j + 1] = temp
					
					// Mostra o passo da ordenação (opcional para fins educativos)
					escreva("Trocando ", temp, " e ", vetor[j], " -> [")
					para (k = 0; k < tamanho; k++)
					{
						escreva(vetor[k])
						se (k < tamanho - 1)
						{
							escreva(", ")
						}
					}
					escreva("]\n")
				}
			}
		}
		
		escreva("\n--- RESULTADO FINAL ---\n")
		se (opcao == 1)
		{
			escreva("Vetor ordenado em ordem CRESCENTE:\n")
		}
		senao
		{
			escreva("Vetor ordenado em ordem DECRESCENTE:\n")
		}
		
		escreva("[")
		para (i = 0; i < tamanho; i++)
		{
			escreva(vetor[i])
			se (i < tamanho - 1)
			{
				escreva(", ")
			}
		}
		cadeia refazer
		escreva("]\n\n")
		escreva("Deseja refazer? [s/n]\n")
		leia(refazer)
		se(refazer == "s" ou refazer == "sim")
		{
			limpa()
			inicio()
		}
		senao
		{
			escreva("\nObrigado por usar o programa!")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2808; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */