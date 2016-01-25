let btoi b:bool = if b then 1 else 0

let smod i:int n:pos : index n =
  let idx = (i%n + n) % n in
  if idx >= 0 & idx < n then (idx:index n) else (0:index n) (* else Fall tritt nie ein *)

let sum r:nat s:(natvec r) a:[int|s] = loop acc:int=0; s with x -> acc + a.[x]

let rotate r:nat shape:(natvec r) rot:(intvec r) arr:[bool|shape] =
  gen shape with idx ->
    arr.[ vmap shape,(vmap idx,rot (i,r -> i+r)) (s,i ->
      let idx = (i%s + s) % s in
      if idx >= 0 & idx < s then idx else 0 (* else Fall tritt nie ein *)
    ) ]

let glider = [
    false, true,  false,
    false, false, true,
    true,  true,  true
    : bool | [3, 3]
]

type gt3 = {i:int | i > 3}

let board w:gt3 h:gt3 =
  gen [w,h] with idx ->
    if vfa idx (i -> i < 3)
    then glider.[idx]
    else false

let neighs w:nat h:nat board:[bool | [w,h]] =
  let empty_board = gen [w,h] with [i,j] -> 0 in
  loop counts:[int|[w,h]] = empty_board; [3,3] with [i,j] ->
    let rotatedBoard = rotate 2 [w,h] [i-1, j-1] board in
    gen [w,h] with idx ->
      counts.[idx] + btoi rotatedBoard.[idx]

let life w:nat h:nat currentBoard:[bool | [w,h]] =
  let neigs = neighs w h currentBoard in
  gen [w,h] with idx ->
    neigs.[idx] = 3 or (neigs.[idx] = 4 & currentBoard.[idx])

let print_board w:nat h:nat board:[bool|[w,h]] world:*world =
  loop world:*world = world; [w] with [x] ->
    let world = loop world:*world = world; [h] with [y] ->
      Io.print_string (if board.[[x,y]] then "⌹" else ".") world
    in
    Io.print_newline world

let rec print_gens gens:nat w:nat h:nat board:[bool | [w,h]] world:*world : *([bool | [w,h]], *world) =
  if gens = 0
  then (board, print_board w h board world)
  else
    let (board, world) = print_gens (gens-1) w h board world in
    let world = Io.print_newline world in
    let board = life w h board in
    (board, print_board w h board world)

let main world:*world =
  let w = 10 in
  let h = 10 in
  let (board, world) = print_gens 10 w h (board w h) world in
  world
