programa 
{
/* 
* Programa para conversão entre sistemas numéricos 
* Este programa permite converter números entre os sistemas:
* - Decimal (base 10)
* - Binário (base 2)
* - Hexadecimal (base 16)
*/
	inclua biblioteca Texto --> txt
	inclua biblioteca Util --> u
	funcao inicio() 
	{
		inteiro opcao = 0
		enquanto (opcao != 4) 
		{
		limpa()
		escreva("=== CONVERSOR DE SISTEMAS NUMÉRICOS ===\n")
		escreva("1 - Converter número decimal\n")
		escreva("2 - Converter número binário\n")
		escreva("3 - Converter número hexadecimal\n")
		escreva("4 - Sair\n")
		escreva("Escolha uma opção: ")
		leia(opcao)
		escolha (opcao) 
		{
			caso 1:
			converterDecimal()
			pare
			caso 2:
			converterBinario()
			pare
			caso 3:
			converterHexadecimal()
			pare
			caso 4:
			escreva("Programa finalizado.\n")
			pare
			caso contrario:
			escreva("Opção inválida! Pressione ENTER para continuar...")
			u.aguarde(2000)
		}
		}
	}
	funcao converterDecimal() 
	{
		limpa()
		escreva("=== CONVERSÃO DE DECIMAL ===\n")
		inteiro numeroDecimal
		escreva("Digite um número decimal positivo: ")
		leia(numeroDecimal)
		// Validação de entrada
		se (numeroDecimal < 0) 
		{
			escreva("Erro: Número negativo não é suportado!\n")
			escreva("Pressione ENTER para continuar...")
			u.aguarde(3000)
			retorne
		}
		// Conversões
		cadeia binario = decimalParaBinario(numeroDecimal)
		cadeia hexadecimal = decimalParaHexadecimal(numeroDecimal)
		// Exibição dos resultados
		mostrarResultados(numeroDecimal + " (Decimal)", binario + " (Binário)", hexadecimal + " (Hexadecimal)")
	}
	funcao converterBinario() 
	{
		limpa()
		escreva("=== CONVERSÃO DE BINÁRIO ===\n")
		cadeia numeroBinario
		escreva("Digite um número binário: ")
		leia(numeroBinario)
		// Validação de entrada
		se (nao validarBinario(numeroBinario)) 
		{
			escreva("Erro: Entrada inválida! Um número binário só pode conter 0s e 1s.\n")
			escreva("Pressione ENTER para continuar...")
			u.aguarde(3000)
			retorne
		}
		// Conversões
		inteiro decimal = binarioParaDecimal(numeroBinario)
		cadeia hexadecimal = decimalParaHexadecimal(decimal)
		// Exibição dos resultados
		mostrarResultados(decimal + " (Decimal)", numeroBinario + " (Binário)", hexadecimal + " (Hexadecimal)")
	}
	funcao converterHexadecimal() 
	{
		limpa()
		escreva("=== CONVERSÃO DE HEXADECIMAL ===\n")
		cadeia numeroHexadecimal
		escreva("Digite um número hexadecimal: ")
		leia(numeroHexadecimal)
		// Converter para maiúsculas para facilitar a validação
		numeroHexadecimal = txt.caixa_alta(numeroHexadecimal)
		// Validação de entrada
		se (nao validarHexadecimal(numeroHexadecimal)) 
		{
		escreva("Erro: Entrada inválida! Um número hexadecimal só pode conter dígitos de 0-9 e letras de A-F.\n")
		escreva("Pressione ENTER para continuar...")
		u.aguarde(3000)
		retorne
		}
		// Conversões
		inteiro decimal = hexadecimalParaDecimal(numeroHexadecimal)
		cadeia binario = decimalParaBinario(decimal)
		// Exibição dos resultados
		mostrarResultados(decimal + " (Decimal)", binario + " (Binário)", numeroHexadecimal + " (Hexadecimal)")
	}
	
	funcao mostrarResultados(cadeia decimal, cadeia binario, cadeia hexadecimal) {
	escreva("\n=== RESULTADOS ===\n")
	escreva("Decimal: ", decimal, "\n")
	escreva("Binário: ", binario, "\n")
	escreva("Hexadecimal: ", hexadecimal, "\n")
	escreva("\nPressione ENTER para continuar...")
	
	cadeia tecla
	leia(tecla)
	}
	
	// Função para converter um número decimal para binário
	funcao cadeia decimalParaBinario(inteiro decimal) {
	cadeia binario = ""
	inteiro temp = decimal
	
	// Caso especial para zero
	se (decimal == 0) {
	retorne "0"
	}
	
	// Algoritmo de divisões sucessivas
	enquanto (temp > 0) {
	binario = (temp % 2) + binario
	temp = temp / 2
	}
	
	retorne binario
	}
	
	// Função para converter um número decimal para hexadecimal
	funcao cadeia decimalParaHexadecimal(inteiro decimal) {
	cadeia hexadecimal = ""
	inteiro temp = decimal
	cadeia digitos = "0123456789ABCDEF"
	
	// Caso especial para zero
	se (decimal == 0) {
	retorne "0"
	}
	
	// Algoritmo de divisões sucessivas
	enquanto (temp > 0) {
	inteiro resto = temp % 16
	hexadecimal = txt.extrair_subtexto(digitos, resto, resto + 1) + hexadecimal
	temp = temp / 16
	}
	
	retorne hexadecimal
	}
	
	// Função para converter um número binário para decimal
	funcao inteiro binarioParaDecimal(cadeia binario) {
	inteiro decimal = 0
	inteiro tamanho = txt.numero_caracteres(binario)
	
	para (inteiro i = 0; i < tamanho; i++) {
	caracter digito = txt.obter_caracter(binario, i)
	inteiro valor = 0
	
	se (digito == '1') {
	valor = 1
	}
	
	decimal = decimal * 2 + valor
	}
	
	retorne decimal
	}
	
	// Função para converter um número hexadecimal para decimal
	funcao inteiro hexadecimalParaDecimal(cadeia hexadecimal) {
	inteiro decimal = 0
	inteiro tamanho = txt.numero_caracteres(hexadecimal)
	
	para (inteiro i = 0; i < tamanho; i++) {
	caracter digito = txt.obter_caracter(hexadecimal, i)
	inteiro valor = 0
	
	se (digito >= '0' e digito <= '9') {
	// Converter caractere '0'-'9' para valor inteiro 0-9
	escolha(digito) {
	caso '0': valor = 0 pare
	caso '1': valor = 1 pare
	caso '2': valor = 2 pare
	caso '3': valor = 3 pare
	caso '4': valor = 4 pare
	caso '5': valor = 5 pare
	caso '6': valor = 6 pare
	caso '7': valor = 7 pare
	caso '8': valor = 8 pare
	caso '9': valor = 9 pare
	}
	} senao se (digito >= 'A' e digito <= 'F') {
	// Converter caractere 'A'-'F' para valor inteiro 10-15
	escolha(digito) {
	caso 'A': valor = 10 pare
	caso 'B': valor = 11 pare
	caso 'C': valor = 12 pare
	caso 'D': valor = 13 pare
	caso 'E': valor = 14 pare
	caso 'F': valor = 15 pare
	}
	}
	
	decimal = decimal * 16 + valor
	}
	
	retorne decimal
	}
	
	// Função para validar se uma string contém apenas dígitos binários (0 e 1)
	funcao logico validarBinario(cadeia binario) {
	inteiro tamanho = txt.numero_caracteres(binario)
	
	para (inteiro i = 0; i < tamanho; i++) {
	caracter digito = txt.obter_caracter(binario, i)
	se (digito != '0' e digito != '1') {
	retorne falso
	}
	}
	
	retorne verdadeiro
	}
	
	// Função para validar se uma string contém apenas dígitos hexadecimais (0-9, A-F)
	funcao logico validarHexadecimal(cadeia hexadecimal) {
	inteiro tamanho = txt.numero_caracteres(hexadecimal)
	
	para (inteiro i = 0; i < tamanho; i++) {
	caracter digito = txt.obter_caracter(hexadecimal, i)
	se ((digito < '0' ou digito > '9') e (digito < 'A' ou digito > 'F')) {
	retorne falso
	}
	}
	
	retorne verdadeiro
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2930; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */