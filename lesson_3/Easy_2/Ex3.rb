# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# throw out the really old people (age 100 or older).

ages.each do |k, v|
  if v >= 100
    ages.tap { |hs| hs.delete(k) }
  end
end

puts ages

# or 
# ages.keep_if { |k, v| v < 100 }