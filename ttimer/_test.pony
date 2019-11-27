use "fileExt"
use "ponytest"
use "flow"

actor Main
	let timer:TTimer
	
	be timerNotify() =>
		@fprintf[I32](@pony_os_stdout[Pointer[U8]](), "timer fired!\n".cstring())
	
	new create(env: Env) =>
		@fprintf[I32](@pony_os_stdout[Pointer[U8]](), "timer created!\n".cstring())
		timer = TTimer(1000, this)
