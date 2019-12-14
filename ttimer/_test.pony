use "fileExt"
use "ponytest"
use "flow"

actor Main
	be timerNotify(timer:TTimer tag) =>
		@fprintf[I32](@pony_os_stdout[Pointer[U8]](), "timer fired!\n".cstring())
	
	new create(env: Env) =>
		@fprintf[I32](@pony_os_stdout[Pointer[U8]](), "timer created!\n".cstring())
		TTimer(1000, this)
