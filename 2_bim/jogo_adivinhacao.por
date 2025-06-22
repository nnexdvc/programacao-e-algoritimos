programa
{
	// Bibliotecas necessárias para manipulação de texto e funções utilitárias
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		// Variáveis para controle do jogo
		inteiro numeroSorteado = 0  // Número que o jogador precisa adivinhar
		inteiro palpite = 0         // Número digitado pelo jogador
		inteiro tentativas = 0      // Contador de tentativas
		inteiro maxNumero = 10      // Limite máximo do número (ajustado conforme nível)
		inteiro opcao = 0           // Opção de nível escolhida
		inteiro vidas = 0           // Número de tentativas restantes
		logico acertou = falso      // Flag para controlar se o jogador acertou
		cadeia continuar            // Resposta para jogar novamente
		inteiro tentativasArray[15] // Vetor para armazenar as tentativas
		
		// Menu de seleção de nível
		limpa()
		escreva("[1] Fácil (1-10, tentativas ilimitadas)\n[2] Médio (1-50, 15 tentativas)\n[3] Difícil (1-100, 10 tentativas)\nEscolha sua dificuldade: ")
		leia(opcao)
		
		// Configuração do nível escolhido
		escolha (opcao)
		{
			caso 1:  // Nível fácil: números de 1 a 10, tentativas ilimitadas
				maxNumero = 10
				vidas = -1  // -1 indica tentativas ilimitadas
				pare
			caso 2:  // Nível médio: números de 1 a 50, 15 tentativas
				maxNumero = 50
				vidas = 14 
				pare
			caso 3:  // Nível difícil: números de 1 a 100, 10 tentativas
				maxNumero = 100
				vidas = 9 
				pare
			caso contrario:  // Opção inválida
				escreva("Opção inválida! Tente novamente.\n")
				u.aguarde(2000)
				inicio()
		}
		
		// Inicialização do jogo
		limpa()
		acertou = falso
		tentativas = 0
		numeroSorteado = u.sorteia(1, maxNumero)  // Sorteia número aleatório
		
		escreva("Número entre 1 e ", maxNumero, "\n")
		
		// Loop principal do jogo
		enquanto (nao acertou)
		{
			// Mostra tentativas restantes (exceto no nível fácil)
			se(vidas > 0)
			{
				escreva("\nTentativas restantes: ", vidas)
			}
			escreva("Palpite: ")
			leia(palpite)
			
			// Armazena a tentativa no vetor
			tentativasArray[tentativas] = palpite
			
			// Validação do palpite
			se (palpite < 1 ou palpite > maxNumero)
			{
				escreva("Número entre 1 e ", maxNumero, "\n")
			}
			senao
			{
				tentativas = tentativas + 1
				// Verifica se o palpite é maior ou menor
				se (palpite < numeroSorteado)
				{
					// Verifica se acabaram as tentativas
					se (vidas == 0) 
					{
						limpa()
						escreva("Fim de jogo! O número era: ", numeroSorteado, "\n")
						escreva("Suas tentativas: ")
						para(inteiro i = 0; i < tentativas; i++)
						{
							escreva(tentativasArray[i], " ")
						}
						escreva("\nDeseja tentar novamente? [s/n]\n")
						leia(continuar)
						se(t.caixa_baixa(continuar) == "sim" ou t.caixa_baixa(continuar) == "s")
						{
							inicio()
						} 
						senao
						{
							pare
						}
					}
					escreva("Maior\n")
					vidas = vidas - 1
				}
				senao se (palpite > numeroSorteado)
				{
					// Verifica se acabaram as tentativas
					se (vidas == 0) 
					{
						limpa()
						escreva("Fim de jogo! O número era: ", numeroSorteado, "\n")
						escreva("Suas tentativas: ")
						para(inteiro i = 0; i < tentativas; i++)
						{
							escreva(tentativasArray[i], " ")
						}
						escreva("\nDeseja tentar novamente? [s/n]\n")
						leia(continuar)
						se(t.caixa_baixa(continuar) == "sim" ou t.caixa_baixa(continuar) == "s")
						{
							inicio()
						} 
						senao
						{
							pare
						}
					}
					escreva("Menor\n")
					vidas = vidas - 1
				}
				senao  // Acertou o número
				{
					acertou = verdadeiro
					limpa()
					escreva("Parabéns! Você acertou em ", tentativas, " tentativa(s)!\n")
					escreva("O número era: ", numeroSorteado, "\n")
					escreva("Suas tentativas: ")
					para(inteiro i = 0; i < tentativas; i++)
					{
						escreva(tentativasArray[i], " ")
					}
				}
			}
		}
		
		// Pergunta se quer jogar novamente
		escreva("\n\nJogar novamente? [s/n] ")
		leia(continuar)
		se(t.caixa_baixa(continuar) == "sim" ou t.caixa_baixa(continuar) == "s")
		{
			inicio()
		}
	}
}