run: build
	./main.x

build:
	gcc -march=native -Ofast main.c -S -masm=intel -o main.asm
	gcc -ggdb -march=native -Ofast main.c -o main.x