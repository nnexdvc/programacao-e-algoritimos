programa
{
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u
	funcao inicio()
	{
		inteiro numeroSorteado = 0, palpite = 0, tentativas = 0, maxNumero = 10, opcao = 0, vidas = 0
		logico acertou = falso
		cadeia continuar
		enquanto (opcao != 4)
		{
			limpa()
			escreva("=== JOGO DE ADIVINHAÇÃO ===\n")
			escreva("Escolha a dificuldade:\n")
			escreva("[1] Fácil (números de 1 a 10)\n")
			escreva("[2] Médio (números de 1 a 50)\n")
			escreva("[3] Difícil (números de 1 a 100)\n")
			escreva("[4] Fim (sair do jogo)\n")
			escreva("Opção: ")
			leia(opcao)
			escolha (opcao)
			{
				caso 1:
					maxNumero = 10
					escreva("Modo Fácil selecionado!\n")
					pare
				caso 2:
					maxNumero = 50
					vidas = 14 
					escreva("Modo Médio selecionado!\n")
					pare
				caso 3:
					maxNumero = 100
					vidas = 9 
					escreva("Modo Difícil selecionado!\n")
					pare
				caso 4:
					escreva("\nObrigado por jogar! Até a próxima!\n")
					pare
				caso contrario:
					escreva("Opção inválida! Tente novamente.\n")
					u.aguarde(2000)
			}
			se (opcao >= 1 e opcao <= 3)
			{
				limpa()
				acertou = falso
				tentativas = 0
				numeroSorteado = u.sorteia(1, maxNumero)
				escreva("Estou pensando em um número entre 1 e ", maxNumero, "\n")
				escreva("Tente adivinhar!\n")
				enquanto (nao acertou)
				{
					escreva("Seu palpite: ")
					leia(palpite)
					se (palpite < 1 ou palpite > maxNumero)
					{
						escreva("Por favor, digite um número entre 1 e ", maxNumero, "\n")
					}
					senao
					{
						tentativas = tentativas + 1
						se (palpite < numeroSorteado)
						{
							se (vidas == 0) 
							{
								escreva("Que pena! As vidas acabaram. Deseja tentar novamente?\n")
								leia(continuar)
								se(t.caixa_baixa (continuar) == "sim" ou t.caixa_baixa (continuar) == "s")
								{
									 inicio()
								} 
								senao
								{
									escreva("\nObrigado por jogar! Até a próxima!\n")
									pare
								}
							}
							escreva("O número sorteado é MAIOR\n")
							escreva("Ainda restam " + vidas + "vidas...\n")
							vidas = vidas - 1
						}
						senao se (palpite > numeroSorteado)
						{
							se (vidas == 0) 
							{
								escreva("\nQue pena! As vidas acabaram. Deseja tentar novamente?\n")
								leia(continuar)
								se(t.caixa_baixa (continuar) == "sim" ou t.caixa_baixa (continuar) == "s")
								{
									 inicio()
								} 
								senao
								{
									escreva("\nObrigado por jogar! Até a próxima!\n")
									pare
								}
							}
							escreva("O número sorteado é MENOR\n")
							escreva("Ainda restam " + (vidas) + " vidas...\n")
							vidas = vidas - 1
						}
						senao
						{
							acertou = verdadeiro
							escreva("Parabéns! Você acertou na ", tentativas, "º tentativa!\n")
						}
					}
				}
				escreva("Pressione Enter para voltar ao menu principal...\n")
				cadeia tecla
				leia(tecla)
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 613; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */