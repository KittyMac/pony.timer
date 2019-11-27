build_dir=./build

all: pony run
	
pony: check-folders
	stable env /Volumes/Development/Development/pony/ponyc/build/release/ponyc -o ./build/ ./ttimer

check-folders:
	-mkdir ./build

clean:
	rm ./build/*

run:
	./build/ttimer
