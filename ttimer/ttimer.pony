
interface TTimerNotify
	be timerNotify(timer:TTimer tag)

actor TTimer
	"""
	A simple timer. Don't use it if it rubs you the wrong way.
	"""
	let target:TTimerNotify tag
	
	let avoidFlooding:Bool
	let milliseconds:U64
	var timerStartMillis:U64
	var cancelled:Bool = false
	
	fun _priority():USize => -99
		
	new create(milliseconds':U64, target':TTimerNotify tag, avoidFlooding':Bool = false) =>
		target = target'
		
		avoidFlooding = avoidFlooding'
		milliseconds = milliseconds'
		timerStartMillis = @ponyint_cpu_tick[U64]() / 1_000_000
		
		_check()
	
	be resume() =>
		if cancelled == true then
			cancelled = false
			_check()
		end
	
	be cancel() =>
		cancelled = true
	
	be _check() =>
		if cancelled then
			return
		end
		
		let nowInMillis = @ponyint_cpu_tick[U64]() / 1_000_000
		if nowInMillis >= (timerStartMillis + milliseconds) then
		
			if avoidFlooding == false then
				target.timerNotify(this)
			else
				if @ponyint_actor_num_messages[USize](target) < 4 then
					target.timerNotify(this)
				end
			end
			
			timerStartMillis = nowInMillis
		end
		
		let timeToSleep = ((timerStartMillis + milliseconds) - nowInMillis) * 1000
		if timeToSleep > 0 then
			@usleep[I32](timeToSleep.u32() / 2)
		end
		
		@ponyint_actor_yield[None](this)
		_check()
