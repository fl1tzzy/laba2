def count_full_pegs(rings)
  # Создаем хэш, где ключ - это кольцо, а значение - это массив цветов, которые находятся на этом кольце
  pegs = Hash.new { |hash, key| hash[key] = [] }

  # Проходим по каждому символу в строке с шагом 2 (т.е. цвет и кольцо)
  (0...rings.length).step(2) do |i|
    color = rings[i] # цвет
    peg = rings[i + 1] # кольцо

    # Добавляем цвет в массив на соответствующем кольце, если он еще не добавлен
    pegs[peg] << color unless pegs[peg].include?(color)
  end

  # счетчик полных колец
  full_peg_count = 0
  # Проходим по всем кольцам в хэше
  pegs.each_value do |colors|
    # Если на кольце находятся все три цвета, увеличиваем счетчик полных колец
    full_peg_count += 1 if colors.uniq.size == 3
  end

  # Возвращаем количество полных колец
  full_peg_count
end

def main
  puts "Enter the rings configuration: "
  rings = gets.chomp

  puts "Number of full pegs: #{count_full_pegs(rings)}"
end

main