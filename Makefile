
test : expected.dat 
		./tocrc.sh <./input.dat >./result.dat
		diff ./expected.dat ./result.dat
