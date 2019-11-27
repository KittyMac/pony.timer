# pony.ttimer

**WARNING** While this code should work standard Pony, it is designed to take full advantage of the changes I have introduced in [my fork of Pony](https://github.com/KittyMac/ponyc/tree/roc_master). Most of the changes to Pony involve improvements to the Pony runtime. The list of these changes are documented in my [pony.problems](https://github.com/KittyMac/pony.problems) respository.

### Purpose

This repository is just me hacking around with [Pony](https://www.ponylang.io). It should not be used as an example of good Pony programming practices.

### Timer

One can argue that this class is horrible and that you should use Pony's built in timers.  I don't have a strong argument against that, other than while attempting to use Pony on iOS the built in timers used an insane amount of CPU and left the app unstable.  I'm using these for now until I have the luxury of delving into why the standard Pony timers are not working well for me.


## License

pony.ttimer is free software distributed under the terms of the MIT license, reproduced below. pony.ttimer may be used for any purpose, including commercial purposes, at absolutely no cost. No paperwork, no royalties, no GNU-like "copyleft" restrictions. Just download and enjoy.

Copyright (c) 2019 Rocco Bowling

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.