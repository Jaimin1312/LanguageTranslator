%{

%}

%%



[0-9]+".0"|[0-9]+ {
	printf("Integer Digit is %s %d\n",yytext,atoi(yytext));
} 

[0-9]+"."[0-9]+ {
	printf("Float Digit is %s %f\n",yytext,atof(yytext));
}

if|for|while|do|exit|else|case|switch|until {
	printf("Keyword %s \n",yytext);
}

([A-Z]|[a-z])([a-z]|[A-Z]|[0-9])* {
	printf("Identifier %s\n",yytext);
}

"++"|"--"|"+"|"/"|"-"|"%"|"^"|"*"|"=="|"="|"<="|">="|"||"|"&&"|"!="|"<"|">" {
	printf("Operator is %s\n",yytext);
}



[***]([a-z]|[A-Z]|[0-9]|[\n]|[\b]|[\t]|[" "]|"+"|"/"|"-"|"%"|"*"|"=="|"<="|">="|"<>"|"]"|"["|[{]|[}]|[,]|[(]|[)])* {
	printf("Comment %s\n",yytext);
}

[[]|[]]|[(]|[)]|[,]|[{]|[}] {
	printf("Punctuation %s\n",yytext);
}

[']([a-z]|[A-Z]|[0-9]|[\n]|[\b]|[\t]|[" "]|"+"|"/"|"-"|"%"|"*"|"=="|"<="|">="|"<>"|"]"|"["|[{]|[}]|[,]|[(]|[)])+['] {
	printf("String Constant is %s\n",yytext);
} 

[" "]|[\n]|[\t]|[\b][\r] {
	printf("Space and Blank tab: %s\n",yytext);
}

. {
	printf("invalid %s\n",yytext);
}
%%

int yywrap(){}

int main()
{
	yylex();
	return 0;
}
