Program Ex02;
uses CRT;

type //Declaração do registro
  registro = record
    nome: string [30];
    codigo, sexo: integer;
    horas, salb, sall, desconto: real;
  end;

var //Declaração de variáveis
  cadastro: array[1..10] of registro;
  i, j, n, op, c, cont1, cont2: integer;
  mm, mf, r1, r2: real;
  enter: string [30];
   
//Primeiro procedimento (Cadastro e coleta de informações)
procedure cadastrando;
begin
  writeln ("Realize o cadastro dos professores: ");
  for i:= 1 to n do
  begin
    writeln ("Professor ", i);
    write ("Nome: ");
    readln (cadastro[i].nome);
    writeln ("Sexo: 1.Masculino / 2.Feminino");
    readln (cadastro[i].sexo);
    write ("Horas trabalhadas no mes: ");
    readln (cadastro[i].horas);
    write ("Insira o codigo do professor: ");
    readln (cadastro[i].codigo);
    writeln ("");
  end;
  clrscr;
  writeln ("Cadastro realizado com sucesso");
  writeln ("Aperte <ENTER> para continuar");
  readln (enter);
  for i:= 1 to n do
  begin
    cadastro[i].salb:= ((cadastro[i].horas) * 60.5);  
  end;
end;

//Segundo procedimento (MENU)
procedure MENU;
begin
  clrscr;
  writeln ("MENU");
  writeln ("1. Listar professores");
  writeln ("2. Media aritmetica dos salarios brutos (Feminino)");
  writeln ("3. Media aritmetica dos salarios brutos (Masculino)");
  writeln ("4. Sair");
  write ("Escolha uma opcao: ");
  readln (op);
end;

//Terceiro procedimento (Listar professores)
procedure Listar;
begin
  clrscr;
  for i:= 1 to n do
  begin
    writeln ("Professor ", i);
    writeln (cadastro[i].nome);
    writeln (cadastro[i].codigo);
    writeln ((cadastro[i].horas):3:3 , " horas");
    writeln ("Salario bruto: ", (cadastro[i].salb):3:3);
    writeln ("Salario liquido: ", (cadastro[i].sall):3:3);
    writeln ("Desconto: ", (cadastro[i].desconto):3:3);
    writeln ("");
  end;
  writeln ("Aperte <ENTER> para voltar ao MENU");
  readln (enter);
end;

//Quarto procedimento (Media Aritmetica dos homens)
procedure mediamasculina;
begin
  c:= 70;
  for i:= 1 to n do
  begin
    if ((cadastro[i].sexo) = 1) then //Homens com menos de 70 horas
    begin
       if ((cadastro[i].horas) < c) or ((cadastro[i].horas) = c)  then
       begin
         cadastro[i].desconto:= ((cadastro[i].salb) * 0.10);
       end;
       
       if ((cadastro[i].horas) > 70) then
       begin
         cadastro[i].desconto:= ((cadastro[i].salb) * 0.08);
       end;
       cont1:= (cont1 + 1);
    end;
  end;
  for i:= 1 to n do
  begin
    if (cadastro[i].sexo = 1) then
    begin
       mm:= (mm + (cadastro[i].salb));
    end;
  end;
  
end;


//Quinto procedimento (Media Aritmetica das mulheres)
procedure mediafeminina;
begin
  c:= 70;
  if ((cadastro[i].sexo) = 2) then //Mulheres com menos de 70 horas
    begin
       if ((cadastro[i].horas) < c) or ((cadastro[i].horas) = c) then
       begin
         cadastro[i].desconto:= ((cadastro[i].salb) * 0.07);
       end;
       if ((cadastro[i].horas) > 70) then
       begin  
         cadastro[i].desconto:= ((cadastro[i].salb) * 0.05);
       end;
       cont2:= (cont2 + 1);   
    end;
    
  for i:= 1 to n do
  begin
    if (cadastro[i].sexo = 2) then
    begin
       mf:= (mf + (cadastro[i].salb));
    end;
  end;
end;

//Sexto processo (Desconto)
procedure descontando;
begin
  for i:= 1 to n do
  begin
    cadastro[i].sall:= ((cadastro[i].salb) - (cadastro[i].desconto));
  end;
end;

begin
//Para testes, n será um declarado
  n:= 3;

  //Utilizando procedimentos para criar o programa

  //Fazer o cadastro é um procedimento obrigatório
  cadastrando; //Primeiro procedimento
  //Esse procedimento coleta as informações e já calcula o que se solicita

  //Escrevendo o MENU
  //Dentro de um REPEAT
  repeat

    MENU;
    //Escreve o menu e da valor a variável OP

    if (op = 1) then
    begin
       mediamasculina;
       mediafeminina;
       descontando;
       Listar;
    end;

    if (op = 2) then
    begin
       r2:= (mf/cont2);
       writeln ("A media aritmetica do salario bruto das mulheres igual a ", r2:3:3);
       writeln ("Aperte <ENTER> para voltar para o MENU");
       readln (enter);
    end;

    if (op = 3) then
    begin
       r1:= (mm/cont1);
       writeln ("A media aritmetica do salario bruto dos homens e igual a ", r1:3:3);
       writeln ("Aperte <ENTER> para voltar para o MENU");
       readln (enter);
    end;

  until (op = 4);


end.

