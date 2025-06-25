programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Texto --> t
	inclua biblioteca Calendario
	
	funcao inicio()
	{
		inteiro opcao
		cadeia opcoes[] = {
		"            Menu Principal", 
		"",
		"[1] Preencher vetores",
		"[2] Verificar Dia/Mês",
		"[3] Estados",
		"[4] Conversor de Numeros para Extenso",
		"[5] Jogo de adivinhação",
		"[6] Sorteio de Nomes",
		"[7] Fim",
		""}
		
		faca
		{
			limpa()
			janela(opcoes)
			
			escreva("\nDigite sua opção: ")
			leia(opcao)
	
			escolha(opcao)
			{
			caso 1:
				vetores()
				pare
			caso 2:
				dia_mes()
				pare
			caso 3:
				estados() 
				pare
			caso 4:
				conversor_numero_extenso()
				pare
			caso 5:
				jogo_sorteio()
				pare
			caso 6:
				sorteio_nomes()
				pare
			caso 7:
				fim()
				pare
			caso contrario:
				escreva("\n***opção invalida***")
				u.aguarde(5000)
				pare            
			}
		}enquanto(opcao!=7)

	}

	funcao sorteio_nomes()
	{
		cadeia nomes[100]
		cadeia duplas[50][2] // Matriz para armazenar as duplas [dupla][pessoa1/pessoa2]
		inteiro totalNomes = 0
		inteiro totalDuplas = 0
		inteiro quantidadeNomes
		cadeia nomeTemp
		logico nomeExiste
		inteiro opcaoSorteio
		cadeia refazer
		
		faca
		{
			totalNomes = 0
			totalDuplas = 0
			
			limpa()
			escreva("=== SORTEIO DE NOMES ===\n\n")
			
			// Perguntar quantos nomes serão adicionados
			escreva("Quantos participantes serão adicionados? ")
			leia(quantidadeNomes)
			
			se(quantidadeNomes <= 0 ou quantidadeNomes > 100)
			{
				escreva("Quantidade inválida! Deve ser entre 1 e 100 participantes.\n")
				u.aguarde(2000)
				retorne
			}
			
			limpa()
			escreva("=== CADASTRO DE PARTICIPANTES ===\n\n")
			
			// Coletar todos os nomes de uma vez
			para(inteiro i = 0; i < quantidadeNomes; i++)
			{
				faca
				{
					escreva("Digite o nome do " + (i + 1) + "º participante: ")
					leia(nomeTemp)
					
					// Verificar se o nome já existe
					nomeExiste = falso
					para(inteiro j = 0; j < totalNomes; j++)
					{
						se(nomes[j] == nomeTemp)
						{
							nomeExiste = verdadeiro
							pare
						}
					}
					
					se(nomeExiste)
					{
						escreva("ERRO: Este nome já foi cadastrado! Digite outro nome.\n")
					}
					senao
					{
						nomes[totalNomes] = nomeTemp
						totalNomes++
					}
				} enquanto(nomeExiste)
			}
			
			limpa()
			escreva("=== PARTICIPANTES CADASTRADOS ===\n")
			para(inteiro i = 0; i < totalNomes; i++)
			{
				escreva((i + 1) + ". " + nomes[i] + "\n")
			}
			escreva("\nTotal de participantes: " + totalNomes + "\n\n")
			
			// perguntar o tipo de sorteio desejado
			escreva("Que tipo de sorteio deseja realizar?\n")
			escreva("[1] Sorteio individual (cada nome separadamente)\n")
			escreva("[2] Formar duplas e sortear as duplas\n")
			escreva("[0] Cancelar sorteio\n")
			escreva("\nEscolha uma opção: ")
			leia(opcaoSorteio)
			
			escolha(opcaoSorteio)
			{
				caso 1:
					// sorteio individual
					se(totalNomes == 1)
					{
						limpa()
						escreva("Há apenas um participante: " + nomes[0] + "\n")
						escreva("Sorteio realizado automaticamente!\n")
						escreva("1º LUGAR: " + nomes[0] + "\n")
					}
					senao
					{
						// criar cópia do vetor para não alterar o original
						cadeia nomesSorteio[100]
						inteiro totalSorteio = totalNomes
						
						// copiar nomes para o vetor de sorteio
						para(inteiro i = 0; i < totalNomes; i++)
						{
							nomesSorteio[i] = nomes[i]
						}
						
						limpa()
						escreva("=== RESULTADO DO SORTEIO INDIVIDUAL ===\n\n")
						
						// sortear todos os nomes em ordem de classificação
						para(inteiro posicao = 1; posicao <= totalNomes; posicao++)
						{
							inteiro indiceSorteado
							cadeia nomeSorteado
							
							// se só resta um nome, não precisa sortear
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
							
							// remover o nome sorteado do vetor
							para(inteiro j = indiceSorteado; j < totalSorteio - 1; j++)
							{
								nomesSorteio[j] = nomesSorteio[j + 1]
							}
							totalSorteio--
						}
						
						escreva("\nSorteio individual concluído!\n")
					}
					pare
					
				caso 2:
					// formar duplas e sortear
					se(totalNomes < 2)
					{
						escreva("É necessário pelo menos 2 participantes para formar duplas!\n")
						u.aguarde(2000)
					}
					senao
					{
						// criar cópia do vetor para não alterar o original
						cadeia nomesTemp[100]
						inteiro totalTemp = totalNomes
						
						// copiar nomes para o vetor temporário
						para(inteiro i = 0; i < totalNomes; i++)
						{
							nomesTemp[i] = nomes[i]
						}
						
						limpa()
						escreva("=== FORMAÇÃO DE DUPLAS ===\n\n")
						
						// formar duplas sorteando pares
						enquanto(totalTemp >= 2)
						{
							// sortear primeira pessoa da dupla
							inteiro indice1 = u.sorteia(0, totalTemp - 1)
							cadeia pessoa1 = nomesTemp[indice1]
							
							// remover primeira pessoa do vetor temporário
							para(inteiro j = indice1; j < totalTemp - 1; j++)
							{
								nomesTemp[j] = nomesTemp[j + 1]
							}
							totalTemp--
							
							// sortear segunda pessoa da dupla
							inteiro indice2
							cadeia pessoa2
							
							// se só resta uma pessoa, não precisa sortear
							se(totalTemp == 1)
							{
								indice2 = 0
								pessoa2 = nomesTemp[0]
							}
							senao
							{
								indice2 = u.sorteia(0, totalTemp - 1)
								pessoa2 = nomesTemp[indice2]
							}
							
							// remover segunda pessoa do vetor temporário
							para(inteiro j = indice2; j < totalTemp - 1; j++)
							{
								nomesTemp[j] = nomesTemp[j + 1]
							}
							totalTemp--
							
							// adicionar dupla à matriz
							duplas[totalDuplas][0] = pessoa1
							duplas[totalDuplas][1] = pessoa2
							totalDuplas++
							
							escreva("Dupla " + totalDuplas + ": " + pessoa1 + " & " + pessoa2 + "\n")
						}
						
						// verificar se sobrou alguém
						se(totalTemp == 1)
						{
							escreva("\nParticipante sem dupla: " + nomesTemp[0] + " (ficará de fora ou será trio)\n")
						}
						
						escreva("\nTotal de duplas formadas: " + totalDuplas + "\n")
						
						// agora sortear as duplas
						se(totalDuplas == 1)
						{
							escreva("\nHá apenas uma dupla formada!\n")
							escreva("1º LUGAR: " + duplas[0][0] + " & " + duplas[0][1] + "\n")
						}
						senao
						{
							// criar índices das duplas para sorteio
							inteiro indicesDuplas[50]
							inteiro totalIndiceSorteio = totalDuplas
							
							// inicializar índices
							para(inteiro i = 0; i < totalDuplas; i++)
							{
								indicesDuplas[i] = i
							}
							
							escreva("\n=== RESULTADO DO SORTEIO DE DUPLAS ===\n\n")
							
							// sortear todas as duplas em ordem de classificação
							para(inteiro posicao = 1; posicao <= totalDuplas; posicao++)
							{
								inteiro indiceSorteado
								inteiro dupla_indice
								
								// se só resta uma dupla, não precisa sortear
								se(totalIndiceSorteio == 1)
								{
									indiceSorteado = 0
									dupla_indice = indicesDuplas[0]
								}
								senao
								{
									indiceSorteado = u.sorteia(0, totalIndiceSorteio - 1)
									dupla_indice = indicesDuplas[indiceSorteado]
								}
								
								escreva(posicao + "º LUGAR: " + duplas[dupla_indice][0] + " & " + duplas[dupla_indice][1] + "\n")
								
								// remover o índice sorteado
								para(inteiro j = indiceSorteado; j < totalIndiceSorteio - 1; j++)
								{
									indicesDuplas[j] = indicesDuplas[j + 1]
								}
								totalIndiceSorteio--
							}
							
							escreva("\nSorteio de duplas concluído!\n")
						}
					}
					pare
					
				caso 0:
					escreva("Sorteio cancelado.\n")
					pare
					
				caso contrario:
					escreva("Opção inválida! Sorteio cancelado.\n")
					pare
			}
			
			// perguntar se quer refazer o sorteio
			escreva("\nDeseja refazer o sorteio? (S/N): ")
			leia(refazer)
			
		} enquanto(refazer == "S" ou refazer == "s" ou refazer == "SIM" ou refazer == "sim" ou refazer == "Sim")
		
		escreva("Obrigado por usar o sistema de sorteio!\n")
	}

	funcao vetores() 
	{
		inteiro vetor[10], pares = 0, impares = 0, maior = 0, pos1 = 0, menor = 0, pos2 = 0, soma = 0
		real media = 0.0
		cadeia refazer, ordenar
		inteiro opcao_ordem = 0
		logico continuar = verdadeiro
		limpa()
		para (inteiro posicao = 0; posicao < 10; posicao++)
		{
			escreva("Informe o ", (posicao+1), "º número: ")
			leia(vetor[posicao])
			se (posicao == 0) 
			{
				maior = vetor[posicao]
				menor = vetor[posicao]
				pos1 = posicao
				pos2 = posicao
			}
			se (vetor[posicao] > maior) 
			{
				maior = vetor[posicao]
				pos1 = posicao
			}
			se (vetor[posicao] < menor) 
			{
				menor = vetor[posicao]
				pos2 = posicao
			}
			se (vetor[posicao] % 2 == 0) 
			{
				pares++
			} 
			senao 
			{
				impares++
			}
			soma += vetor[posicao]
		}
		
		media = (soma * 1.0) / 10
		limpa()
		escreva ("Vetor na ordem original:\n")
		para (inteiro posicao = 0; posicao < 10; posicao++)
		{
			escreva("\n", (posicao+1), "º número -> ", vetor[posicao])
			se (vetor[posicao] % 2 == 0) 
			{
				escreva(" (par)")
			} 
			senao 
			{
				escreva(" (ímpar)")
			}
		}
		
		escreva("\n\nResumo das informações obtidas:\n")
		escreva("Quantidade de nº pares: ", pares, "\n")
		escreva("Quantidade de nº ímpares: ", impares, "\n")
		escreva("O maior nº informado foi o ", maior, " na posição ", (pos1+1), "\n")
		escreva("O menor nº informado foi o ", menor, " na posição ", (pos2+1), "\n")
		escreva("A somatória de todos os nº é ", soma, "\n")
		escreva("A média aritmética é: ", media, "\n")
		
		escreva("\nDeseja ordenar o vetor usando Bubble Sort? [s/n] ")
		leia(ordenar)
		
		se (ordenar == "sim" ou ordenar == "s")
		{
			limpa()
			escreva("===========================================\n")
			escreva("    ALGORITMO DE ORDENAÇÃO BUBBLE SORT    \n")
			escreva("===========================================\n\n")
			
			continuar = verdadeiro
			enquanto (continuar)
			{
				escreva("--- ESCOLHA DA ORDEM ---\n")
				escreva("[1] Ordem CRESCENTE (menor para maior)\n")
				escreva("[2] Ordem DECRESCENTE (maior para menor)\n")
				escreva("Escolha uma opção (1 ou 2): ")
				leia(opcao_ordem)
				
				se (opcao_ordem == 1 ou opcao_ordem == 2)
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
			
			// loop principal do Bubble Sort
			para (inteiro i = 0; i < 9; i++)
			{
				// loop interno para comparações adjacentes
				para (inteiro j = 0; j < 9 - i; j++)
				{
					// condição de troca baseada na ordem escolhida
					logico deve_trocar = falso
					
					se (opcao_ordem == 1) // ordem crescente
					{
						se (vetor[j] > vetor[j + 1])
						{
							deve_trocar = verdadeiro
						}
					}
					senao // ordem decrescente
					{
						se (vetor[j] < vetor[j + 1])
						{
							deve_trocar = verdadeiro
						}
					}
					
					// realiza a troca se necessário
					se (deve_trocar)
					{
						inteiro temp = vetor[j]
						vetor[j] = vetor[j + 1]
						vetor[j + 1] = temp
						
						// mostra o passo da ordenação
						escreva("Trocando ", temp, " e ", vetor[j], " -> [")
						para (inteiro k = 0; k < 10; k++)
						{
							escreva(vetor[k])
							se (k < 9)
							{
								escreva(", ")
							}
						}
						escreva("]\n")
					}
				}
			}
			
			escreva("\n--- RESULTADO FINAL ---\n")
			se (opcao_ordem == 1)
			{
				escreva("Vetor ordenado em ordem CRESCENTE:\n")
			}
			senao
			{
				escreva("Vetor ordenado em ordem DECRESCENTE:\n")
			}
			
			escreva("[")
			para (inteiro i = 0; i < 10; i++)
			{
				escreva(vetor[i])
				se (i < 9)
				{
					escreva(", ")
				}
			}
			escreva("]\n")
		}
		
		escreva("\nVocê deseja refazer? [s/n] ")
		leia(refazer)
		se (refazer == "sim" ou refazer == "s") 
		{
			limpa()
			vetores()
		}
	}

	funcao dia_mes()
	{
		cadeia mes[] = {"", "janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"}
		cadeia dia[] = {"", "domingo", "segunda-Feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado"}
		cadeia refazer
		inteiro opcao, diaSelecionado, mesSelecionado
		logico continuar = verdadeiro
		cadeia menu[] = {
			"Consulta de Dia/Mês",
			"",
			"[1] Consultar dia",
			"[2] Consultar mês",
			"[3] Consultar dia e mês"
		}
		
		enquanto(continuar)
		{
			limpa()
			janela(menu)
			escreva("\nDigite sua opção: ")
			leia(opcao)
			
			se(opcao >= 1 e opcao <= 3)
			{
				limpa()
				se(opcao == 1)
				{
					diaSelecionado = consultarDia()
				}
				senao se(opcao == 2)
				{
					mesSelecionado = consultarMes()
				}
				senao
				{
					diaSelecionado = consultarDia()
					mesSelecionado = consultarMes()
					limpa()
					escreva("\nO dia selecionado foi " + dia[diaSelecionado] + " e o mês selecionado foi " + mes[mesSelecionado] + "\n")
				}
				
				escreva("\nDeseja consultar novamente? [s/n]\n")
				leia(refazer)
				se(refazer != "sim" e refazer != "s")
				{
					continuar = falso
				}
			}
			senao
			{
				limpa()
				escreva("*** Opção inválida ***")
				u.aguarde(2000)
			}
		}
	}
	
	funcao inteiro consultarDia()
	{
		cadeia dia[] = {"", "domingo", "segunda-Feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado"}
		inteiro n = 0
		logico valido = falso
		
		enquanto(nao valido)
		{
			limpa()
			escreva("Digite um número para consultar o dia: ")
			leia(n)
			se(n >= 0 e n <= 7)
			{
				valido = verdadeiro
			}
			senao
			{
				limpa()
				escreva("*** Dia inválido ***") 
				u.aguarde(2000)
			}
		}
		escreva("\n" + n + " corresponde a " + dia[n] + "\n")
		retorne n
	}
	
	funcao inteiro consultarMes()
	{
		inteiro n = 0
		cadeia mes[] = {"", "janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"}
		logico valido = falso
		
		enquanto(nao valido)
		{
			limpa()
			escreva("\nDigite um número para consultar o mês: ")
			leia(n)
			se(n >= 0 e n <= 12)
			{
				valido = verdadeiro
			}
			senao
			{
				limpa()
				escreva("*** Mês inválido ***") 
				u.aguarde(2000)
			}
		}
		escreva("\n" + n + " corresponde ao " + mes[n] + "\n")
		retorne n
	}

	funcao estados()
	{
		limpa()
		cadeia estado[27][2]
		inteiro i
		cadeia texto, refazer
		logico encontrou = falso
		cadeia menu[] = {"", "Consulta de Estados", ""}
		
		estado[0][0] = "SP"		estado[0][1] = "São Paulo"
		estado[1][0] = "RJ"		estado[1][1] = "Rio de Janeiro"
		estado[2][0] = "MG"		estado[2][1] = "Minas Gerais"
		estado[3][0] = "SC"		estado[3][1] = "Santa Catarina"
		estado[4][0] = "PA"		estado[4][1] = "Pará"
		estado[5][0] = "PR"		estado[5][1] = "Paraná"
		estado[6][0] = "RN"		estado[6][1] = "Rio Grande do Norte"
		estado[7][0] = "BA"		estado[7][1] = "Bahia"
		estado[8][0] = "SE"		estado[8][1] = "Sergipe"
		estado[9][0] = "PE"		estado[9][1] = "Pernambuco"
		estado[10][0] = "MT"	estado[10][1] = "Mato Grosso"
		estado[11][0] = "MS"	estado[11][1] = "Mato Grosso do Sul"
		estado[12][0] = "GO"	estado[12][1] = "Goiás"
		estado[13][0] = "AL"	estado[13][1] = "Alagoas"
		estado[14][0] = "AC"	estado[14][1] = "Acre"
		estado[15][0] = "AP"	estado[15][1] = "Amapá"
		estado[16][0] = "AM"	estado[16][1] = "Amazonas"
		estado[17][0] = "CE"	estado[17][1] = "Ceará"
		estado[18][0] = "ES"	estado[18][1] = "Espirito Santo"
		estado[19][0] = "MA"	estado[19][1] = "Maranhão"
		estado[20][0] = "PI"	estado[20][1] = "Piauí"
		estado[21][0] = "PB"	estado[21][1] = "Paraíba"
		estado[22][0] = "RR"	estado[22][1] = "Roraima"
		estado[23][0] = "RO"	estado[23][1] = "Rondônia"
		estado[24][0] = "TO"	estado[24][1] = "Tocantins"
		estado[25][0] = "RS"	estado[25][1] = "Rio Grande do Sul"
		estado[26][0] = "DF"	estado[26][1] = "Distrito Federal"
		
		janela(menu)
		escreva("\nDigite uma sigla ou nome do estado (com acentos): ")
		leia(texto)
		
		para(i=0; i<27; i++)
		{
			se(t.caixa_alta(texto) == estado[i][0])
			{
				escreva("\nA sigla " + t.caixa_alta(texto) + " corresponde ao estado " + estado[i][1])
				encontrou = verdadeiro
				pare
			}
			senao se(t.caixa_baixa(texto) == t.caixa_baixa(estado[i][1]))
			{
				escreva("\nO estado " + texto + " corresponde à sigla " + estado[i][0])
				encontrou = verdadeiro
				pare
			}
		}
		
		se(encontrou == falso)
		{
			limpa()
			escreva("Sigla/estado inválido, tente novamente.")
			u.aguarde(2000)
			estados()
		}
		
		escreva("\n\nDeseja consultar outro estado? [s/n] ")
		leia(refazer)
		se(refazer == "sim" ou refazer == "s") 
		{
			estados()
		}
		senao
		{
			inicio()
		}
	}
	
	funcao conversor_numero_extenso()
	//obs: o portugol é limitado quando se fala de manipulação de strings, para deixar o output com a primeira letra da sentença maiúscula, nos restou duas opções: deixar tudo em minúsculo (escolhemos esse), ou tudo em maiúsculo.
	{
		cadeia unidade[] = {"zero", "um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove", "dez", "onze", "doze", "treze", "quatorze", "quinze", "dezesseis", "dezessete", "dezoito", "dezenove"}
		cadeia dezena[] = {"", "", "vinte", "trinta", "quarenta", "cinquenta", "sessenta", "setenta", "oitenta", "noventa"}
		cadeia refazer
		cadeia centena[] = {"", "cento", "duzentos", "trezentos", "quatrocentos", "quinhentos", "seiscentos", "setecentos", "oitocentos", "novecentos"}
		inteiro n = 0, resto = 0
		cadeia extenso = ""
		cadeia menu[] = {"", "Conversor de Números para Extenso", ""}
		
		limpa()
		janela(menu)
		escreva("\nInforme um número (0-1000): ")
		leia(n)
		
		se(n<0 ou n>1000)
		{
			escreva("*** Número inválido ***")      
		}
		senao se (n<20) // 0-19
		{
			extenso = unidade[n]
		}
		senao se (n<100) // 20-99
		{
			extenso = dezena[n/10]
			resto = n%10
			se(resto>0)
			{
				extenso += " e " + unidade[resto]
			}
		}
		senao se (n==100) // 100
		{
			extenso = "cem"
		}
		senao se (n<1000) // 101 - 999
		{
			extenso = centena[n/100]
			resto = n%100
			
			se(resto>0)
			{
				se(resto<20)
				{
					extenso += " e " + unidade[resto]
				}
				senao
				{
					extenso += " e " + dezena[resto/10]
					se(resto%10>0)
					{
						extenso += " e " + unidade[resto%10]
					}
				}
			}
		}
		senao se (n==1000) // 1000
		{
			extenso = "mil"
		}
		escreva(extenso)
		escreva("\nVocê deseja refazer? [s/n] ")
		leia(refazer)
		se (refazer == "sim" ou refazer == "s") 
		{
			limpa()
			conversor_numero_extenso()
		}
	}
	
	funcao jogo_sorteio()
	{
		limpa()
		inteiro nivel, numero_sorteado, tentativa, tentativas_restantes
		inteiro tentativas[15]
		inteiro contador = 0
		cadeia refazer
		logico jogar = verdadeiro
		cadeia menu[] = {
			"Jogo de Adivinhação",
			"",
			"[1] Fácil (1-10, tentativas ilimitadas)",
			"[2] Médio (1-50, 15 tentativas)",
			"[3] Difícil (1-100, 10 tentativas)"
		}
		
		limpa()
		janela(menu)
		escreva("\nDigite sua opção: ")
		leia(nivel)
		
		se(nivel < 1 ou nivel > 3)
		{
			limpa()
			escreva("*** Nível inválido ***")
			u.aguarde(2000)
			jogo_sorteio()
			retorne
		}
		
		limpa()
		se(nivel == 1)
		{
			numero_sorteado = u.sorteia(1, 10)
			tentativas_restantes = -1 // -1 indica tentativas ilimitadas
		}
		senao se(nivel == 2)
		{
			numero_sorteado = u.sorteia(1, 50)
			tentativas_restantes = 15
		}
		senao
		{
			numero_sorteado = u.sorteia(1, 100)
			tentativas_restantes = 10
		}
		
		enquanto(jogar)
		{
			se(tentativas_restantes > 0)
			{
				escreva("\nTentativas restantes: ", tentativas_restantes)
			}
			escreva("\nDigite um número: ")
			leia(tentativa)
			tentativas[contador] = tentativa
			contador++
			
			se(tentativa == numero_sorteado)
			{
				limpa()
				escreva("Parabéns! Você acertou em ", contador, " tentativa(s)!\n")
				escreva("Número sorteado: ", numero_sorteado, "\n")
				escreva("Suas tentativas: ")
				para(inteiro i = 0; i < contador; i++)
				{
					escreva(tentativas[i], " ")
				}
				escreva("\n\nDeseja jogar novamente? [s/n] ")
				leia(refazer)
				se(refazer == "sim" ou refazer == "s")
				{
					jogo_sorteio()
					retorne
				}
				jogar = falso
			}
			senao
			{
				se(tentativa > numero_sorteado)
				{
					escreva("O número é menor que ", tentativa, "\n")
				}
				senao
				{
					escreva("O número é maior que ", tentativa, "\n")
				}
				
				se(tentativas_restantes > 0)
				{
					tentativas_restantes--
				}
				
				se(tentativas_restantes == 0)
				{
					limpa()
					escreva("Suas tentativas acabaram!\n")
					escreva("O número sorteado era: ", numero_sorteado, "\n")
					escreva("Suas tentativas: ")
					para(inteiro i = 0; i < contador; i++)
					{
						escreva(tentativas[i], " ")
					}
					escreva("\n\nDeseja jogar novamente? [s/n] ")
					leia(refazer)
					se(refazer == "sim" ou refazer == "s")
					{
						jogo_sorteio()
						retorne
					}
					jogar = falso
				}
			}
		}
	}

	funcao janela(cadeia vetor[])
	{
		inteiro x
		inteiro tam = u.numero_elementos(vetor)
		inteiro largura = 0
		inteiro margem = 4
		
		para(x=0; x<tam; x++)
		{
			se(t.numero_caracteres(vetor[x])>largura)
			{
				largura = t.numero_caracteres(vetor[x]) + 1
			}
		}
		
		largura += margem * 2 // margem nos dois lados
		
		escreva("╔")
		para (x=1; x<=largura; x++)
		{
			escreva("═") //superior
		}
		escreva("╗\n")
		
		para(x=0; x<tam; x++)
		{
			escreva("║") //borda esquerda
			para(inteiro y = 0; y<margem; y++) //margem esquerda
			{
				escreva(" ")
			}
			escreva(vetor[x])
			para(inteiro y = 0; y<largura-t.numero_caracteres(vetor[x])-margem; y++) //margem direita
			{
				escreva(" ")
			}
			escreva("║\n")
		}
		
		escreva("╚")
		para (x=1; x<=largura; x++)
		{
			escreva("═") //inferior
		}
		escreva("╝")
	}
	
	funcao fim()
	{
	    limpa()
	    escreva("Obrigado por utilizar o programa! Até mais.\n")
	    u.aguarde(2000)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 10; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */