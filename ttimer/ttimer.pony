
interface TTimerNotify
	be timerNotify()

actor TTimer
	"""
	A simple timer. Don't use it if it rubs you the wrong way.
	"""
	let target:TTimerNotify tag
	
	let milliseconds:U64
	var timerStartMillis:U64
	
	fun _priority():USize => -99
		
	new create(milliseconds':U64, target':TTimerNotify tag) =>
		target = target'
		
		milliseconds = milliseconds'
		timerStartMillis = @ponyint_cpu_tick[U64]() / 1_000_000
		
		_check()
	
	be _check() =>
		let nowInMillis = @ponyint_cpu_tick[U64]() / 1_000_000
		if nowInMillis >= (timerStartMillis + milliseconds) then
			target.timerNotify()
			timerStartMillis = nowInMillis
		end
		
		let timeToSleep = ((timerStartMillis + milliseconds) - nowInMillis) * 1000
		if timeToSleep > 0 then
			@usleep[I32](timeToSleep.u32() / 2)
		end
		
		@ponyint_actor_yield[None](this)
		_check()
