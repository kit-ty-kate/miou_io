external reraise : exn -> 'a = "%reraise"

let openfile filename flags perm =
  Miou.yield ();
  let fd = Unix.openfile filename flags perm in
  try
    Miou_unix.of_file_descr fd
  with
  | e -> Unix.close fd; reraise e

let with_file filename flags perm f =
  let fd = openfile filename flags perm in
  Fun.protect ~finally:(fun () -> Miou_unix.close fd) begin fun () ->
    f fd
  end

let opendir dirname =
  Miou.yield ();
  Unix.opendir dirname

let closedir dir =
  Miou.yield ();
  Unix.closedir dir

let with_dir dirname f =
  let dir = opendir dirname in
  Fun.protect ~finally:(fun () -> closedir dir) begin fun () ->
    f dir
  end

let readdir dir =
  Miou.yield ();
  Unix.readdir dir

let mkdir dirname perm =
  Miou.yield ();
  Unix.mkdir dirname perm

let stat filename =
  Miou.yield ();
  Unix.stat filename

let unlink filename =
  Miou.yield ();
  Unix.unlink filename

let rmdir filename =
  Miou.yield ();
  Unix.rmdir filename
