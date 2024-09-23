external reraise : exn -> 'a = "%reraise"

let openfile filename flags perm =
  Miou.yield ();
  Unix.openfile filename flags perm

let close fd =
  Miou.yield ();
  Unix.close fd

let with_file filename flags perm f =
  let fd = openfile filename flags perm in
  Fun.protect ~finally:(fun () -> close fd) begin fun () ->
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
