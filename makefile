build_dir=./build

all: pony run
	
pony: check-folders
	stable env /Volumes/Development/Development/pony/ponyc/build/release/ponyc -o ./build/ ./ttimer

check-folders:
	@mkdir -p ./build

clean:
	rm ./build/*

run:
	./build/ttimer

test: check-folders
	stable env /Volumes/Development/Development/pony/ponyc/build/release/ponyc -V=0 -o ./build/ ./ttimer
	./build/ttimer