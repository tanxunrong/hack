
all :
	cc calc.tab.c calc.yy.c -o calc.out
.PHONY : all

clean :
	rm calc.out
.PHONY : clean
