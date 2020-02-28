# ################################################
#
#					C Makefile
#		PDS Exercise 1: Vantage-Point Tree Build
#	  Versions: Sequential, Pthreads, openMP, Cilk
#
#			Author: Panagiotis Karelis (9099)
#           Author: Emmanouil Michalainas (9070) 
# ################################################
#
# 'make' build executable file 'main'
# 'make lib' build the libraries .a
# 'make clean' removes all .o and executables
#

#define the shell to bash
SHELL := /bin/bash

#define the C compiler to use
CC = gcc-7

#define compile-time flags
CFLAGS = -Wall -O3 -pthread -fopenmp -fcilkplus

#define directories containing header files
INCLUDES = -I ./inc

#define objects
OBJ = vptree_sequential.o vptree_pthreads.o vptree_cilk.o vptree_openmp.o

########################################################################

lib: $(OBJ)
	ar rcs lib/vptree_cilk.a lib/vptree_cilk.o
	ar rcs lib/vptree_pthreads.a lib/vptree_pthreads.o
	ar rcs lib/vptree_openmp.a lib/vptree_openmp.o
	ar rcs lib/vptree_sequential.a lib/vptree_sequential.o
	rm lib/vptree_cilk.o lib/vptree_sequential.o lib/vptree_openmp.o lib/vptree_pthreads.o

%.o: src/%.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o lib/$@

clean:
	rm lib/*.a