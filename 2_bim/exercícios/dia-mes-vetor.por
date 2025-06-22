programa
{
	// Biblioteca necessária para funções utilitárias
	inclua biblioteca Util --> u
	
	// Arrays com os nomes dos dias e meses
	cadeia dia[] = {"", "Domingo", "Segunda-Feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sábado"}
	cadeia mes[] = {"", "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
	
	funcao inicio()
	{
		// Variáveis para controle do programa
		cadeia refazer
		inteiro opcao, diaSelecionado, mesSelecionado
		
		// Menu de opções
		limpa()
		escreva("[1] Consultar dia\n")
		escreva("[2] Consultar mês\n")
		escreva("[3] Consultar dia e mês\n")
		escreva("Digite sua opção: ")
		leia(opcao)
		
		// Validação da opção
		se(opcao < 1 ou opcao > 3)
		{
			limpa()
			escreva("*** Opção inválida ***")
			u.aguarde(2000)
			inicio()
		}
		
		// Processamento da opção escolhida
		limpa()
		se(opcao == 1)  // Consulta apenas dia
		{
			diaSelecionado = consultarDia()
			escreva("\nDeseja refazer? [s/n]\n")
			leia(refazer)
			se (refazer == "sim" ou refazer == "s")
			{
				inicio()
			}
		}
		senao se(opcao == 2)  // Consulta apenas mês
		{
			mesSelecionado = consultarMes()
			escreva("\nDeseja refazer? [s/n]\n")
			leia(refazer)
			se (refazer == "sim" ou refazer == "s")
			{
				inicio()
			}
		}
		senao  // Consulta dia e mês
		{
			diaSelecionado = consultarDia()
			mesSelecionado = consultarMes()
			limpa()
			escreva("\nO dia selecionado foi " + dia[diaSelecionado] + " e o mês selecionado foi " + mes[mesSelecionado] + "\n")
			escreva("\nDeseja refazer? [s/n]\n")
			leia(refazer)
			se (refazer == "sim" ou refazer == "s")
			{
				inicio()
			}
		}
	}
	
	// Função para consultar o dia da semana
	funcao inteiro consultarDia()
	{
		inteiro n
		limpa()
		escreva("Digite um número para consultar o dia: ")
		leia(n)
		// Validação do número do dia
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
	
	// Função para consultar o mês
	funcao inteiro consultarMes()
	{
		inteiro n
		limpa()
		escreva("\nDigite um número para consultar o mês: ")
		leia(n)
		// Validação do número do mês
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
}