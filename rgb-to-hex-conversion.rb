def rgb(r, g, b)
  max = 255
  min = 0
  r = constrain_number(r, max, min)
  g = constrain_number(g, max, min)
  b = constrain_number(b, max, min)
  return get_hex(r, true) + get_hex(g, true) + get_hex(b, true)
end

def get_hex(num, padded)
  mult_15_counter = 0
  string = ""
  if num > 15
    while num > 15
      num -= 16
      mult_15_counter += 1
    end
    string += get_hex(mult_15_counter, false) + get_hex(num, false)
  elsif num > 9
    string += (num + 55).chr
  else
    string += (num + 48).chr
  end

  if padded && string.length == 1
    return '0' + string
  else
    return string
  end
end

def constrain_number(num, max, min)
  return num = max if num > max
  return num = min if num < min
  num
end
