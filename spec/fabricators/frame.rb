Fabricator(:frame) do
  game { Fabricate(:game) }
  knock { Frame::TYPES[:regular] }
end
