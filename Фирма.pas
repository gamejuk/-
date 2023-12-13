Var
  i, j, n : Integer;
  firms : array of String;
  prices : array of Real;
  sum, average : Real;
Begin
  Write('Введите количество фирм: ');
  Readln(n);

  SetLength(firms, n);
  SetLength(prices, n);

  for i := 0 to n-1 do
  begin
    Write('Введите название фирмы ', i+1, ': ');
    Readln(firms[i]);

    Write('Введите стоимость услуги фирмы ', i+1, ': ');
    Readln(prices[i]);
  end;

  // сортировка по убыванию цены
  for i := 0 to n-2 do
    for j := i+1 to n-1 do
      if prices[i] < prices[j] then
      begin
        // меняем местами названия фирм
        firms[i] := firms[i] + firms[j];
        firms[j] := Copy(firms[i], 1, Length(firms[i])-Length(firms[j]));
        firms[i] := Copy(firms[i], Length(firms[j])+1, Length(firms[i]));

        // меняем местами цены
        prices[i] := prices[i] + prices[j];
        prices[j] := prices[i] - prices[j];
        prices[i] := prices[i] - prices[j];
      end;

  // вывод названий и цен фирм
  for i := 0 to n-1 do
    Writeln(firms[i], ' - ', prices[i]:0:2);

  // подсчет средней стоимости услуги
  sum := 0;
  for i := 0 to n-1 do
    sum := sum + prices[i];
  average := sum / n;

  Writeln('Средняя стоимость услуги: ', average:0:2);
End.