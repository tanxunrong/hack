%{
#define LINE_BUF_SIZE 1024
#include "util.h"
#include "calc.tab.h"

int yywrap(void)
{
	return 1;
}
%}
%s COMMENT STRING_LITERAL
%%
"+" return ADD;
"-" return SUB;
"*" return MUL;
"/" return DIV;
"\n" return CR;
"(" return LP;
")" return RP;
"func" return FUNC;
"end" return END;
"if"  return IF;
"else" return ELSE;
"elseif" return ELSEIF;
"while" return WHILE;
"=" return ASSIGN;
"==" return EQUAL;
"!=" return NOT_EQUAL;


<INITIAL>\n { inc_line_num(); }
<INITIAL># BEGIN(COMMENT);
<INITIAL>. {
	char jbuf[LINE_BUF_SIZE];
	if (isprint(yytext[0]) {
		jbuf[0] = yytext[0];
		jbuf[1] = '\0';
	} else {
		sprintf(buf,"0x%02x",(unsigned char)yytext[0]);
	}
}
	
<COMMENT>\n {
	inc_line_num();
	BEGIN(INITIAL);
}
<COMMENT>. {
	;
}

<STRING_LITERAL>\" {
	Expr *epr = jade_expr_new(EXPR_STRING);
	expr->u.string_val = 
%%

