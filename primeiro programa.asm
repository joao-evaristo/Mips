.data
	inputDia: .asciiz "Entre com o dia (DD): " #Mensagem do input de dia
	erroDia: .asciiz "Dia invalido.\n" #Mensagem de erro no dia
	inputMes: .asciiz "Entre com o mes (MM): " #Mensagem do input de mes
	erroMes: .asciiz "Mes invalido.\n" #Mensagem de erro no mes
	inputAno: .asciiz "Entre com o ano (AAAA): " #Mensagem de input do ano
	erroAno: .asciiz "Ano invalido.\n" #Mensagem de erro no ano
	outputFinal: .asciiz "\n\nData de Nascimento: " #Mensagem de saida final
	barra: .asciiz "/"
	
.text
.globl main
main:
	#Laco que e repetido enquanto a condicao de entrada do dia nao for satisfeita
	whileDia: 
		#Input dia
		li $v0, 4 #Instrucao para impressao de string
		la $a0, inputDia #Indicar o endereco da mensagem
		syscall #faca: imprima
		li $v0, 5 #Leitura de inteiros
		syscall #faca: leia
		#Comparacao para ver se o dia e menor que 1 ou maior que 31
		addi $t0, $zero, 1 #$t0 recebe 1
		addi $t1,$zero, 31 #$t1 recebe 31
		slt $t2, $v0, $t0 #Se a entrada do dia for menor que $t0 = 1, $t2 e setado
		slt $t3, $t1, $v0 #Se $t1 = 31 for menor que a entrada, $t2 e setado
		OR $t4, $t3, $t2 #Se $t4 e setado caso $t2 ou $t3 estiverem setados
		beq $t4, $zero, diaOk #Se $t4 for igual a zero, isso e, nenhuma condicao foi violada, o programa vai para diaOk
		li $v0, 4 
		la $a0, erroDia
		syscall #A mensagem de erro no dia e exibida
		j whileDia #Retorna para o while
	diaOk:
		move $s0, $v0 #Move a entrada para $s0
		j whileMes
	
	#Laco que e repetido enquanto a condicao de entrada do mes nao for satisfeita
	whileMes:
		#Input mes
		li $v0, 4 #Instrucao para impressao de string
		la $a0, inputMes #Indicar o endereco da mensagem
		syscall #faca: imprima
		li $v0, 5 #Leitura de inteiros
		syscall #faca: leia
		#Comparacao para ver se o mes e menor que 1 ou maior que 12
		addi $t0, $zero, 1 #$t0 recebe 1
		addi $t1,$zero, 12 #$t1 recebe 12
		slt $t2, $v0, $t0 #Se a entrada do mes for menor que $t0 = 1, $t2 e setado
		slt $t3, $t1, $v0 #Se $t1 = 12 for menor que a entrada, $t2 e setado
		OR $t4, $t3, $t2 #Se $t4 e setado caso $t2 ou $t3 estiverem setados
		beq $t4, $zero, mesOk #Se $t4 for igual a zero, isso e, nenhuma condicao foi violada, o programa vai para mesOk
		li $v0, 4 
		la $a0, erroMes
		syscall #A mensagem de erro no mes e exibida
		j whileMes #Retorna para o while
	mesOk:
		move $s1, $v0 #Move a entrada para $s1
		j whileAno
	
	#Laco que e repetido enquanto a condicao de entrada do mes nao for satisfeita
	whileAno:
		#Input ano
		li $v0, 4 #Instrucao para impressao de string
		la $a0, inputAno #Indicar o endereco da mensagem
		syscall #faca: imprima
		li $v0, 5 #Leitura de inteiros
		syscall #faca: leia
		#Comparacao para ver se o ano e menor que 1900 ou maior que 2021
		addi $t0, $zero, 1900 #$t0 recebe 1900
		addi $t1,$zero, 2021 #$t1 recebe 2021
		slt $t2, $v0, $t0 #Se a entrada do mes for menor que $t0 = 1, $t2 e setado
		slt $t3, $t1, $v0 #Se $t1 = 31 for menor que a entrada, $t2 e setado
		OR $t4, $t3, $t2 #Se $t4 e setado caso $t2 ou $t3 estiverem setados
		beq $t4, $zero, anoOk #Se $t4 for igual a zero, isso e, nenhuma condicao foi violada, o programa vai para anoOk
		li $v0, 4 
		la $a0, erroAno
		syscall #A mensagem de erro no mes e exibida
		j whileAno #Retorna para o while
	anoOk:
		move $s2, $v0 #Move a entrada para $s2
	
		#Mensagem final do programa
		li $v0, 4
		la $a0, outputFinal
		syscall
	
		#Dia
		li $v0, 1 #Instrucao para impressao de int
		move $a0, $s0 #move o $t0(dia) para $a0
		syscall
	
		#/
		li $v0, 4
		la $a0, barra
		syscall 
	
		#Mes
		li $v0, 1 #Instrucao para impressao de int
		move $a0, $s1 #move o $t1(mes) para $a0
		syscall 
	
		#/
		li $v0, 4
		la $a0, barra
		syscall 
	
		#Ano
		li $v0, 1 #Instrucao para impressao de int
		move $a0, $s2 #move o $t2(ano) para $a0
		syscall 
	
		li $v0, 10 #Fim do programa
		syscall
