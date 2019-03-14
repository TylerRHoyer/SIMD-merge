recursive:
	export OMP_NUM_THREADS=16
	gcc -march=native -Ofast recursive.c -S -masm=intel -o main.asm -fopenmp `pkg-config --cflags --libs glib-2.0`
	gcc -ggdb -march=native -Ofast recursive.c -o main.x -fopenmp -L openmpt `pkg-config --cflags --libs glib-2.0`

iterative:
	export OMP_NUM_THREADS=16
	gcc -march=native -Ofast iterative.c -S -masm=intel -o main.asm -fopenmp `pkg-config --cflags --libs glib-2.0`
	gcc -ggdb -march=native -Ofast iterative.c -o main.x -fopenmp -L openmpt `pkg-config --cflags --libs glib-2.0`