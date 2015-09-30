%%

%line
%column

%unicode

%standalone

%class Lexer

%{
int qtdeID=0;
%}

%eof{
System.out.println("Quantidade de Identificadores encontrados: "+qtdeID);
%eof}

letter          = [A-Za-z]
digit           = [0-9]
endofline 		= [\r|\n|\r\n]
integer         = {digit}+
alphanumeric    = {letter}|{digit}
whitespace      = [ \t]|{endofline}
integer_literal = 0|[1-9][0-9]*
float_literal 	= {integer_literal}.{integer}(E[+|-]?{integer_literal})?
comment_singleLine = "//" [^\r\n]* {endofline}? 
comment_multiLine = "/*"~"*/"
comment = {comment_singleLine}|{comment_multiLine}
identifier = ({letter}|_)({alphanumeric}|_)*

%%
/**
 * REGRAS LEXICAS:
 */
class			{System.out.println("Token class");}
public			{System.out.println("Token public");}
extends			{System.out.println("Token extends");}
static			{System.out.println("Token static");}
void			{System.out.println("Token void");}
int				{System.out.println("Token int");}
boolean			{System.out.println("Token boolean");}
while			{System.out.println("Token while");}
if				{System.out.println("Token if");}
else			{System.out.println("Token else");}
return			{System.out.println("Token return");}
"||"			{System.out.println("Token ||");}
"&&"			{System.out.println("Token &&");}				
"=="			{System.out.println("Token ==");}
"!="			{System.out.println("Token !=");}
"<"				{System.out.println("Token <");}
"<="			{System.out.println("Token <=");}
">"				{System.out.println("Token >");}
">="			{System.out.println("Token >=");}
"+"				{System.out.println("Token +");}
"-"				{System.out.println("Token -");}
"*"				{System.out.println("Token *");}
"/"				{System.out.println("Token /");}
"%"				{System.out.println("Token %");}
"!"				{System.out.println("Token !");}
false			{System.out.println("Token false");}
true			{System.out.println("Token true");}
this			{System.out.println("Token this");}
new				{System.out.println("Token new");}
and             {System.out.println("Token AND"); }
or				{System.out.println("Token OR"); }
"*"             {System.out.println("Token *"); }
"+"             {System.out.println("Token +"); }
"-"             {System.out.println("Token -"); }
"/"             {System.out.println("Token /"); }
"("             {System.out.println("Token ("); }
")"             {System.out.println("Token )"); }
"{"				{System.out.println("Token {}");}
"}"				{System.out.println("Token }");}				
"["				{System.out.println("Token [");}
"]"				{System.out.println("Token ]");}
";"				{System.out.println("Token ;");}
"."				{System.out.println("Token .");}
","				{System.out.println("Token ,");}
"="				{System.out.println("Token =");}
"System.out.println" {System.out.println("Token Syso")}
{comment}		{/* ignore comment*/}
{integer_literal} {System.out.println("Token Integer ("+yytext()+")");}
{float_literal} {System.out.println("Token Float ("+yytext()+")");}
{whitespace}+	{/* ignore whitespace*/}
{identifier}    { qtdeID++; System.out.println("Token ID ("+yytext()+")"); }
.               { System.out.println("Illegal char, '" + yytext() +
                    "' At line: " + yyline + ", column: " + yycolumn); }
