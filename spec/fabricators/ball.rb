Fabricator(:ball) do
  knock { Frame::TYPES[:regular] }
  pins 5
  number 1
  pins 1
  frame 
end
