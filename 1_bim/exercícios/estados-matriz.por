programa
{
	// Bibliotecas necessárias para manipulação de texto e funções utilitárias
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		// Matriz para armazenar siglas e nomes dos estados
		// [i][0] = sigla, [i][1] = nome do estado
		cadeia estado [27][2]
		inteiro i
		cadeia texto
		
		// Inicialização da matriz com os estados brasileiros
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

		// Solicita entrada do usuário
		limpa()
		escreva("Digite uma sigla ou nome do estado (com acentos): ")
		leia(texto)
		
		// Busca o estado na matriz
		logico encontrou = falso
		para(i=0;i<27;i++)
		{
			// Verifica se a entrada corresponde a uma sigla
			se(t.caixa_alta(texto) == estado[i][0])
			{
				escreva("\nA sigla ", t.caixa_alta(texto), " corresponde ao estado ", estado[i][1])
				encontrou = verdadeiro
				pare
			}
			// Verifica se a entrada corresponde a um nome de estado
			senao se(t.caixa_baixa(texto) == t.caixa_baixa(estado[i][1]))
			{
				escreva("\nO estado ", texto, " corresponde à sigla ", estado[i][0])
				encontrou = verdadeiro
				pare
			}
		}
		
		// Se não encontrou, reinicia o programa
		se(nao encontrou)
		{
			limpa()
			escreva("Sigla/estado inválido, tente novamente.")
			u.aguarde(2000)
			inicio()
		}
	}
}