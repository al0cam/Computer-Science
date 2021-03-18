# frozen_string_literal: true

def fibb(previous, current, counter)
  puts current
  counter -= 1
  fibb(current, current + previous, counter) if counter >= 0
end

fibb(0, 1, 7)
