function result = life(board)
  neighbors = zeros(size(board));
  for x = -1:1;
    for y = -1:1;
      neighbors += circshift(board, [x,y]);
    end;
  end;
  result = neighbors == 3 + (neighbors == 4 & board);
end

function result = gen(iterations, board)
  result = board;
  for i = 1:iterations;
    result = life(result);
  end
end

function result = board2str(board)
  result = repmat('.', size(board));
  result(board == 1) = 'X';
end

function print_gens(iterations, board)
  result = cell(1, 2 * iterations - 1);
  result(1:2:end) = arrayfun(@(g) board2str(gen(i, board)),
    1:iterations, 'UniformOutput', false);
  result(2:2:end) = repmat(' ', [size(board, 1) 1]);
  disp(cell2mat(result));
end

r = ismember(reshape(1:9,[3 3])', [2 6 7 8 9]);
R = r;
R(6,6) = 0;

print_gens(4, R)