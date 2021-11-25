.data
	inputDia: .asciiz "Entre com o dia (DD): " #Mensagem do input de dia
	erroDia: .asciiz "Dia invalido.\n" #Mensagem de erro no dia
	inputMes: .asciiz "Entre com o mes (MM): " #Mensagem do input de mês
	erroMes: .asciiz "Mes invalido." #Mensagem de erro no mês
	inputAno: .asciiz "Entre com o ano (AAAA): " #Mensagem de input do ano
	erroAno: .asciiz "Ano invalido." #Mensagem de erro no ano
	outputFinal: .asciiz "\n\nData de Nascimento: " #Mensagem de saída final
	barra: .asciiz "/"
	
.text
	
	whileDia: 
		#Input dia
		li $v0, 4 #Instrução para impressão de string
		la $a0, inputDia #Indicar o endereço da mensagem
		syscall #faça: imprima
		li $v0, 5 #Leitura de inteiros
		syscall #faça: leia
		#Comparação para ver se o dia é menor que 0 ou maior que 30
		addi $t1,$zero, 30 
		slt $t0, $v0, $zero
		slt $t2, $t1, $v0
		OR $t3, $t0, $t2
		beq $t3, $zero, diaOk
		li $v0, 4 
		la $a0, erroDia
		syscall
		j whileDia
	diaOk:
	move $t0, $v0 #Move a entrada para $t0
	
	#Input mês
	li $v0, 4 #Instrução para impressão de string
	la $a0, inputMes #Indicar o endereço da mensagem
	syscall #faça: imprima
	li $v0, 5 #Leitura de inteiros
	syscall #faça: leia
	
	move $t1, $v0 #Move a entrada para $t1
	
	#Input ano
	li $v0, 4 #Instrução para impressão de string
	la $a0, inputAno #Indicar o endereço da mensagem
	syscall #faça: imprima
	li $v0, 5 #Leitura de inteiros
	syscall #faça: leia
	
	move $t2, $v0 #Move a entrada para $t2
	
	#Mensagem final do programa
	li $v0, 4
	la $a0, outputFinal
	syscall
	
	#Dia
	li $v0, 1 #Instrução para impressão de int
	move $a0, $t0 #move o $t0(dia) para $a0
	syscall
	
	#/
	li $v0, 4
	la $a0, barra
	syscall 
	
	#Mês
	li $v0, 1 #Instrução para impressão de int
	move $a0, $t1 #move o $t1(mês) para $a0
	syscall 
	
	#/
	li $v0, 4
	la $a0, barra
	syscall 
	
	#Ano
	li $v0, 1 #Instrução para impressão de int
	move $a0, $t2 #move o $t2(ano) para $a0
	syscall 