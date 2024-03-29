def extrair_enderecos(texto, regex)
  enderecos = []

  texto.scan(regex) do |tipo, nome, numero, complemento, bairro, cidade, estado, cep|
    endereco = {
      tipo: tipo,
      nome: nome,
      numero: numero,
      complemento: complemento,
      bairro: bairro.strip, # Removendo espaços em branco extras
      cidade: cidade,
      estado: estado,
      cep: cep
    }

    enderecos << endereco
  end

  enderecos
end

# Expressão regular para extrair endereços
regex = /(?<tipo>Av\.|Rua|Travessa|Praça|Estrada)\s(?<nome>.+?),?\s(?<numero>\d+).*?(?<complemento>Sala\s\d+)?,?\s?(?<bairro>.+?),\s(?<cidade>.+?)\s-\s(?<estado>[A-Z]{2}),\s(?<cep>\d{5}-\d{3})/

# Exemplo de utilização
texto = "Av. Eng. Eusébio Stevaux, 823 - Santo Amaro, São Paulo - SP, 04696-000
Rua São Paulo, 150
Travessa das Flores, 10 - Casa 5, Jardim Botânico, Rio de Janeiro - RJ, 20020-010"

resultados = extrair_enderecos(texto, regex)

resultados.each do |endereco|
  puts "Tipo: #{endereco[:tipo]}"
  puts "Nome: #{endereco[:nome]}"
  puts "Número: #{endereco[:numero]}"
  puts "Complemento: #{endereco[:complemento]}" unless endereco[:complemento].nil? # Tratando complemento opcional
  puts "Bairro: #{endereco[:bairro]}"
  puts "Cidade: #{endereco[:cidade]}"
  puts "Estado: #{endereco[:estado]}"
  puts "CEP: #{endereco[:cep]}"
  puts ""
end
