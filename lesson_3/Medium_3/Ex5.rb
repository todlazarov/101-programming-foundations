# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# =

def colour_valid_1(color)
  color == "blue" || color = "green"
end