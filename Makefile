GTEST_ROOT = ../googletest/googletest
GTEST_MAIN = $(GTEST_ROOT)/make/libgtest_main.a

CPPFLAGS = -I $(GTEST_ROOT)/include

# Compiler options:
#   Tictactoe and Googletest use C++ 2011.  
#   Compile for debugging (-g), and request warnings (-W).
#   On Windows with Mingw or Cygwin, change "-std=c++11"
#   to "-std=gnu++11".
CXXFLAGS = -std=c++11 -g -Wall -Wextra

# Build and run unit tests
test:	tictactoe_test
	./$<

tictactoe.cc:		tictactoe.h
tictactoe_test.cc:	tictactoe.h

tictactoe_test:		tictactoe_test.o tictactoe.o $(GTEST_MAIN)
# On Linux, need -pthread at end to link correctly.
# On Mac, the -pthread gives a harmless warning that it's not needed.
# On Windows with Mingw or Cygwin, delete -pthread because it causes
# an error.
	g++ -o $@ $^ -pthread
