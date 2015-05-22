KNIGHT_MOVES = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
Knight = Struct.new(:position, :parent)

def possible_moves coord
  possible_moves = KNIGHT_MOVES.map{|i| add_vectors(coord, i)}
  possible_moves.select{|i| valid_move?(i)}
end

def add_vectors v1, v2
  [v1[0]+ v2[0], v1[1]+ v2[1]]
end

def valid_move? move
  move[0]>=0 && move[0] < 8 && move[1]>=0 && move[1] <8
end


def knight_moves start, finish
  knight = Knight.new(start,nil)
  queue = [knight]
  visited = []
  path = []

  while knight.position != finish
    knight = queue.shift
    if !visited.include?(knight)
      visited << knight
      possible_moves(knight.position).each do |i|
        k = Knight.new(i,knight)
        queue << k 
      end
    end
  end

  # After the first (and best because bfs) result is found,
  # the path is reconstructed by adding the parent of the last knight, and his parent's parent ...
  # up to the first knight
  path << knight.position
  while knight.parent!=nil
    path << knight.parent.position
    knight = knight.parent
  end

  puts "You made it in #{(path.size) -1} moves! Here's your path :"
  path.reverse.each{|move| p move}
end

knight_moves [3,3], [4,3]
