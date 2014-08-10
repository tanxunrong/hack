%{
#include <stdio.h>
#include <stdlib.h>
#define YYDEBUG 1
%}
%union {
	int int_value;
	double double_value;
}
%token <double_value> DOUBLE_LITERAL
%token ADD SUB MUL DIV CR
%type <double_value> exp term pri_exp
%%
line_list
	: line
	| line_list line
	;
line
	: exp CR
	{
	printf(">> %lf\n",$1);
	}
	;
exp
	: term
	| exp ADD term
	{
	$$ = $1 + $3
	}
	| exp SUB term
	{
	$$ = $1 - $3;
	}
	;
term
	: pri_exp
	| term MUL pri_exp
	{
	$$ = $1 * $3;
	}
	| term DIV pri_exp
	{
	$$ = $1 / $3;
	}
	;
pri_exp
	: DOUBLE_LITERAL
	;
%%

int yyerror(const char* msg)
{
	extern char *yytext;
	fprintf(stderr,"error yacc : %s\n",yytext);
	return 0;
}

int main(int argc,const char* argv[])
{
	extern int yyparse(void);
	extern FILE *yyin;
	yyin = stdin;
	if (yyparse()) {
	fprintf(stderr,"error \n");
	exit(-1);
	}
	return 0;
}
