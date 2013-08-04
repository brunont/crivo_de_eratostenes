#!/usr/bin/ruby
# encoding: utf-8

include Math

# Crivo de Eratóstenes
#
# http://pt.wikipedia.org/wiki/Crivo_de_Erat%C3%B3stenes
#
# Para exemplificá-lo, vamos determinar a lista de números entre 1 e 30.
# Inicialmente, determina-se o maior número a ser checado. Ele corresponde à raiz quadrada do valor limite, arredondado para baixo. No caso, a raiz de 30, arredondada para baixo, é 5.
# Crie uma lista de todos os números inteiros de 2 até o valor limite: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, e 30.
# Encontre o primeiro número da lista. Ele é um número primo, 2.
# Remova da lista todos os múltiplos do número primo encontrado. No nosso exemplo, a lista fica: 2, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27 e 29.
# O próximo número da lista é primo. Repita o procedimento. No caso, o próximo número da lista é 3. Removendo seus múltiplos, a lista fica: 2, 3, 5, 7, 11, 13, 17, 19, 23, 25 e 29. O próximo número, 5, também é primo; a lista fica: 2, 3, 5, 7, 11, 13, 17, 19, 23 e 29. 5 é o último número a ser verificado, conforme determinado inicialmente. Assim, a lista encontrada contém somente números primos.

puts "-- Crivo de Eratóstenes --"
puts "Qual o valor limite?"

limit = gets.to_i
t0 = Time.now
puts "Valor limite: #{limit}"

# Inicialmente, determina-se o maior número a ser checado. Ele corresponde à raiz quadrada do valor limite, arredondado para baixo.
max_check = sqrt(limit).to_i 
puts "Maior número a ser checado: #{max_check}"

# Crie uma lista de todos os números inteiros de 2 até o valor limite
possible_primes = Array.new
(2..limit).each{|x| possible_primes << x}
puts "Possíveis números primos: #{possible_primes}"

# Encontre o primeiro número da lista. Ele é um número primo, 2.
index = 0
prime_number = possible_primes[index]
puts "Número primo encontrado: #{prime_number}"

while(prime_number <= max_check) do

	# Remova da lista todos os múltiplos do número primo encontrado.
	possible_primes.delete_if{|x| x > prime_number && x % prime_number == 0}
	puts "Possíveis números primos: #{possible_primes}"

	# O próximo número da lista é primo. Repita o procedimento. No caso, o próximo número da lista é 3.
	index += 1
	prime_number = possible_primes[index]
	puts "Número primo encontrado: #{prime_number}"
end

# max_check é o último número a ser verificado, conforme determinado inicialmente. Assim, a lista encontrada contém somente números primos.
puts "Números primos: #{possible_primes} encontrados em #{Time.now - t0} segundos"
