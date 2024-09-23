external reraise : exn -> 'a = "%reraise"

val openfile : string -> Unix.open_flag list -> Unix.file_perm -> Unix.file_descr
val close : Unix.file_descr -> unit
val with_file : string -> Unix.open_flag list -> Unix.file_perm -> (Unix.file_descr -> 'a) -> 'a

val opendir : string -> Unix.dir_handle
val closedir : Unix.dir_handle -> unit
val with_dir : string -> (Unix.dir_handle -> 'a) -> 'a

val readdir : Unix.dir_handle -> string

val mkdir : string -> Unix.file_perm -> unit

val stat : string -> Unix.stats

val unlink : string -> unit

val rmdir : string -> unit
