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
		"[1] Conversor de Numeros para Extenso",
		"[2] Verificar Dia e Mês",
		"[3] Preencher vetores",
		"[4] Estados",
		"[5] Fim"}
		
		faca
		{
			limpa()
			janela(opcoes)
			
			escreva("\nDigite sua opção: ")
			leia(opcao)
	
			escolha(opcao)
			{
			caso 1:
				conversor_numero_extenso()
				pare
			caso 2:
				dia_mes()
				pare
			caso 3:
				vetores() 
				pare
			caso 4:
				estados()
				pare
			caso 5:
				fim()
				pare
			caso contrario:
				escreva("\n***opção invalida***")
			u.aguarde(5000)
			pare            
			}
		}enquanto(opcao!=5)
		limpa()
	}
	funcao conversor_numero_extenso()
	{
		cadeia unidade[] = {"zero", "um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove", "dez", "onze", "doze", "treze", "quatorze", "quinze", "dezesseis", "dezessete", "dezoito", "dezenove"}
		cadeia dezena[] = {"", "", "vinte", "trinta", "quarenta", "cinquenta", "sessenta", "setenta", "oitenta", "noventa"}
		cadeia refazer
		cadeia centena[] = {"", "cento", "duzentos", "trezentos", "quatrocentos", "quinhentos", "seiscentos", "setecentos", "oitocentos", "novecentos"}
		inteiro n, resto
		cadeia extenso = ""
		
		limpa()
		escreva("Informe um número (0-1000): ")
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
	funcao dia_mes()
	{
		cadeia mes[] = {"", "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
		cadeia dia[] = {"", "Domingo", "Segunda-Feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sábado"}
		cadeia refazer
		inteiro opcao, diaSelecionado, mesSelecionado
		
		limpa()
		escreva("=== MENU DE CONSULTA ===\n")
		escreva("1 - Consultar dia\n")
		escreva("2 - Consultar mês\n")
		escreva("3 - Consultar dia e mês\n")
		escreva("Digite sua opção: ")
		leia(opcao)
		
		se(opcao < 1 ou opcao > 3)
		{
			limpa()
			escreva("*** Opção inválida ***")
			u.aguarde(2000)
			inicio()
		}
		
		limpa()
		se(opcao == 1)
		{
			diaSelecionado = consultarDia()
			escreva("\nDeseja refazer? [s/n]\n")
			leia(refazer)
			se (refazer == "sim" ou refazer == "s")
			{
				dia_mes()
			}
		}
		senao se(opcao == 2)
		{
			mesSelecionado = consultarMes()
			escreva("\nDeseja refazer? [s/n]\n")
			leia(refazer)
			se (refazer == "sim" ou refazer == "s")
			{
				dia_mes()
			}
		}
		senao
		{
			diaSelecionado = consultarDia()
			mesSelecionado = consultarMes()
			limpa()
			escreva("\nO dia selecionado foi " + dia[diaSelecionado] + " e o mês selecionado foi " + mes[mesSelecionado] + "\n")
			escreva("\nDeseja refazer? [s/n]\n")
			leia(refazer)
			se (refazer == "sim" ou refazer == "s")
			{
				dia_mes()
			}
		}
	}
	
	funcao inteiro consultarDia()
	{
		cadeia dia[] = {"", "Domingo", "Segunda-Feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sábado"}
		inteiro n
		limpa()
		escreva("Digite um número para consultar o dia: ")
		leia(n)
		se(n<0 ou n>7)
		{
			limpa()
			escreva("*** Dia inválido ***") 
			u.aguarde(2000)
			retorne consultarDia()
		}
		escreva("\n" + n + " corresponde a " + dia[n] + "\n")
		retorne n
	}
	
	funcao inteiro consultarMes()
	{
		inteiro n
		cadeia mes[] = {"", "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
		limpa()
		escreva("\nDigite um número para consultar o mês: ")
		leia(n)
		se(n<0 ou n>12)
		{
			limpa()
			escreva("*** Mês inválido ***") 
			u.aguarde(2000)
			retorne consultarMes()
		}
		escreva("\n" + n + " corresponde ao " + mes[n] + "\n")
		retorne n
	}
	
	funcao vetores() 
	{
		inteiro vetor[10], pares = 0, impares = 0, maior = 0, pos1 = 0, menor = 0, pos2 = 0, soma = 0
		real media = 0.0
		cadeia refazer
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
		escreva("Quantidade de pares --> ", pares, "\n")
		escreva("Quantidade de ímpares --> ", impares, "\n")
		escreva("O maior número informado foi o ", maior, " na posição ", (pos1+1), "\n")
		escreva("O menor número informado foi o ", menor, " na posição ", (pos2+1), "\n")
		escreva("A somatória é --> ", soma, "\n")
		escreva("A média aritmética é --> ", media, "\n")
		escreva("\nVocê deseja refazer? [s/n] ")
		leia(refazer)
		se (refazer == "sim" ou refazer == "s") 
		{
			limpa()
			vetores()
		}
	}
	
	funcao estados()
	{
		limpa()
		cadeia estado [27][2]
		inteiro i
		cadeia texto, refazer
		logico encontrou = falso
		
		estado[0][0] = "SP" estado[0][1] = "São Paulo"
		estado[1][0] = "RJ" estado[1][1] = "Rio de Janeiro"
		estado[2][0] = "MG" estado[2][1] = "Minas Gerais"
		estado[3][0] = "SC" estado[3][1] = "Santa Catarina"
		estado[4][0] = "PA" estado[4][1] = "Pará"
		estado[5][0] = "PR" estado[5][1] = "Paraná"
		estado[6][0] = "RN" estado[6][1] = "Rio Grande do Norte"
		estado[7][0] = "BA" estado[7][1] = "Bahia"
		estado[8][0] = "SE" estado[8][1] = "Sergipe"
		estado[9][0] = "PE" estado[9][1] = "Pernambuco"
		estado[10][0] = "MT" estado[10][1] = "Mato Grosso"
		estado[11][0] = "MS" estado[11][1] = "Mato Grosso do Sul"
		estado[12][0] = "GO" estado[12][1] = "Goiás"
		estado[13][0] = "AL" estado[13][1] = "Alagoas"
		estado[14][0] = "AC" estado[14][1] = "Acre"
		estado[15][0] = "AP" estado[15][1] = "Amapá"
		estado[16][0] = "AM" estado[16][1] = "Amazonas"
		estado[17][0] = "CE" estado[17][1] = "Ceará"
		estado[18][0] = "ES" estado[18][1] = "Espirito Santo"
		estado[19][0] = "MA" estado[19][1] = "Maranhão"
		estado[20][0] = "PI" estado[20][1] = "Piauí"
		estado[21][0] = "PB" estado[21][1] = "Paraíba"
		estado[22][0] = "RR" estado[22][1] = "Roraima"
		estado[23][0] = "RO" estado[23][1] = "Rondônia"
		estado[24][0] = "TO" estado[24][1] = "Tocantins"
		estado[25][0] = "RS" estado[25][1] = "Rio Grande do Sul"
		estado[26][0] = "DF" estado[26][1] = "Distrito Federal"
		
		escreva("Digite um estado ou uma sigla (com acentos): ")
		leia(texto)
		para(i=0;i<27;i++)
		{
			se(t.caixa_alta(texto) == estado[i][0])
			{
				escreva("O estado " + t.caixa_alta(texto) + " corresponde a " + estado[i][1])
				encontrou = verdadeiro
				pare
			}
			senao se(t.caixa_baixa(texto) == t.caixa_baixa(estado[i][1]))
			{
				escreva("O estado " + texto + " corresponde a " + estado[i][0])
				encontrou = verdadeiro
				pare
			}
			se (encontrou == falso)
			{
				limpa()
				escreva("Sigla/estado inválido, tente novamente.")
				u.aguarde(2000)
				estados()
			}
		}
		escreva("\nVocê deseja refazer? [s/n] ")
		leia(refazer)
		se (refazer == "sim" ou refazer == "s") 
		{
			estados()
		}
	}

	funcao janela(cadeia vetor[])
	{
		inteiro x
		inteiro tam = u.numero_elementos(vetor)
		inteiro largura = 0
		
		para(x=0;x<tam;x++)
		{
			se(t.numero_caracteres(vetor[x])>largura)
			{
				largura = t.numero_caracteres(vetor[x]) + 1
			}
		}
		
		escreva("╔")
		para (x=1;x<=largura;x++)
		{
			escreva("═") //superior
		}
		escreva("╗\n")
		
		para(x=0;x<tam;x++)
		{
			escreva("║", vetor[x]) //borda esquerda
			para(inteiro y = 0;y<largura-t.numero_caracteres(vetor[x]);y++) //borda direita
			{
				escreva(" ")
			}
			escreva("║\n")
		}
		
		escreva("╚")
		para (x=1;x<=largura;x++)
		{
			escreva("═") //inferior
		}
		escreva("╝")
	}
	funcao fim(){}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 175; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */