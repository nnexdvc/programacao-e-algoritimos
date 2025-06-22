programa
{
	// Bibliotecas necessárias para manipulação de texto e funções utilitárias
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		// Arrays com os números por extenso
		cadeia unidade[] = {"zero", "um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove", "dez", "onze", "doze", "treze", "quatorze", "quinze", "dezesseis", "dezessete", "dezoito", "dezenove"}
		cadeia dezena[] = {"", "", "vinte", "trinta", "quarenta", "cinquenta", "sessenta", "setenta", "oitenta", "noventa"}
		cadeia centena[] = {"", "cento", "duzentos", "trezentos", "quatrocentos", "quinhentos", "seiscentos", "setecentos", "oitocentos", "novecentos"}
		
		// Variáveis para processamento
		inteiro n, resto
		cadeia extenso = ""
		
		// Solicita entrada do usuário
		limpa()
		escreva("Informe um número (0-1000): ")
		leia(n)
		
		// Validação do número
		se(n<0 ou n>1000)
		{
			limpa()
			escreva("*** Número inválido ***")
			u.aguarde(2000)
			inicio()
		}
		// Números de 0 a 19
		senao se (n<20)
		{
			extenso = unidade[n]
		}
		// Números de 20 a 99
		senao se (n<100)
		{
			extenso = dezena[n/10]
			resto = n%10
			se(resto>0)
			{
				extenso += " e " + unidade[resto]
			}
		}
		// Número 100
		senao se (n==100)
		{
			extenso = "cem"
		}
		// Números de 101 a 999
		senao se (n<1000)
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
		// Número 1000
		senao se (n==1000)
		{
			extenso = "mil"
		}
		
		// Exibe o resultado
		limpa()
		escreva("O número ", n, " por extenso é: ", extenso, "\n")
	}
}