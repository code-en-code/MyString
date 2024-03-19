unit mystring;

interface

uses
  System.Classes,
  System.SysUtils,
  System.AnsiStrings;

type
  TMyString = class
  private
    class function MyTryStrToInt(AString: String): Integer; static;
    { private declarations }
  public
    { public declarations }

///<summary>Remove caracteres especificados de uma String.</summary>
///<summary>Removes specified characters from a String.</summary>
///<param name="ACharacters">String que cont�m os caracteres que ser�o removidos. String containing the characters that will be removed.</param>
///<param name="AString">String onde os caracteres ser�o removidos. String where characters will be removed.</param>
///<returns>Retorna a String com os caracteres removidos. Returns the String with the characters removed.</returns>
///<remarks>O par�metro ACharacters pode conter mais de um caracteres. N�o funciona com caracteres com acentos. The ACharacters parameter can contain more than one character. Does not work with characters with accents.</remarks>
    class function RemoveCharacters(ACharacters, AString: String): String;

///<summary>Recebe uma String e retorna a String somente com n�meros.</summary>
///<summary>Receives a String and returns the String with only numbers.</summary>
///<param name="AString">String que ser� tratada. String that will be treated.</param>
///<returns>Retorna uma String somente com n�meros. Returns a String with only numbers.</returns>
///<remarks>Entrada/Input: 'A1a2' Sa�da/Output: '12'.</remarks>
    class function OnlyNumber(AString: String): String;

///<summary>Separa/Divide uma cadeia de String delimitadas por um separador.</summary>
///<summary>Separates/Divides a string of Strings delimited by a separator.</summary>
///<param name="AString">String que cont�m a cadeia de valores. String that contains the value chain.</param>
///<param name="ASeparator">Caractere separador. Separator character.</param>
///<returns>Retorna um TStringList onde cada item armazena um valor da cadeia de valores em String. Returns a TStringList where each item stores a value from the String value chain.</returns>
///<remarks>Entrada/Input: 'Value1, Value2, Value3' Sa�da/Output: TStringList [1]('Value1') [2]('Value2') [3]('Value3').</remarks>
///<exception cref="Exception">Em caso de exce��o retorna nil. In case of exception returns nil.</exception>
    class function SeparateText(AString: String; ASeparator: Char): TStringList;

///<summary>Conta quantas palavras cont�m em uma String.</summary>
///<summary>Counts how many words are in a String.</summary>
///<param name="AString">String para contar as palavras. String to count the words.</param>
///<returns>Retorna quantas palavras foram encontradas na String. Returns how many words were found in the String.</returns>
///<remarks>Entrada/Input: 'Lorem Ipsum is simply dummy.' Sa�da/Output: 5.</remarks>
    class function WordCount(AString: String): Integer;

///<summary>Conta o n�mero de vezes que uma Substring � encontrada dentro de uma String.</summary>
///<summary>Counts the number of times a Substring is found within a String.</summary>
///<param name="ASubString">SubString a ser localizada na String. SubString to be located in the String.</param>
///<param name="AString">String onde a Substring ser� localizada. String where the Substring will be located.</param>
///<returns>Retorna quantas vezes a Substring foi localizada na String. Returns how many times the Substring was found in the String.</returns>
///<remarks>Entrada/Input: 'is', 'Lorem Ipsum is simply dummy' Sa�da/Output: 1.</remarks>
    class function CountPos(const ASubString: String; AString: String): Integer;

///<summary>Remove os caracteres especiais, deixando somente caracteres numericos e letras.</summary>
///<summary>Removes special characters, leaving only numeric characters and letters.</summary>
///<param name="AString">String original. Original string.</param>
///<returns>Retorna uma String que cont�m somente numeros e letras. Returns a String that contains only numbers and letters.</returns>
///<remarks>Entrada/Input: 'A*1#3!B' Sa�da/Output: 'A13B'.</remarks>
    class function RemoveCharSpecial(AString: String): String;

///<summary>Retorna se o caractere informado � um n�mero.</summary>
///<summary>Returns whether the given character is a number.</summary>
///<param name="AChar">Caractere a ser verificado. Character to be checked.</param>
///<returns>Retorna se o caractere informado � um n�mero entre 0 e 9. Returns whether the given character is a number between 0 and 9.</returns>
///<remarks>Entrada/Input: '1' Sa�da/Output: 'True'.</remarks>
///<remarks>Entrada/Input: 'A' Sa�da/Output: 'False'.</remarks>
    class function CharIsNum(AChar: Char): Boolean;

///<summary>Remove os acentos da String.</summary>
///<summary>Removes accents from the String.</summary>
///<param name="AChar">Caractere a ser verificado. Character to be checked.</param>
///<returns>Retorna se o caractere informado � um n�mero entre 0 e 9. Returns whether the given character is a number between 0 and 9.</returns>
///<remarks>Entrada/Input: '1' Sa�da/Output: 'True'.</remarks>
///<remarks>Entrada/Input: 'A' Sa�da/Output: 'False'.</remarks>
    class function RemoveAccents(AString: String): String;

///<summary>Verifica se existe caracteres min�sculos.</summary>
///<summary>Checks for lowercase characters.</summary>
///<param name="AString">String a ser verificada. String to be checked.</param>
///<returns>Retorna se a string cont�m caracteres min�sculos. Returns whether the string contains lowercase characters.</returns>
///<remarks>Entrada/Input: 'MyString' Sa�da/Output: 'True'.</remarks>
///<remarks>Entrada/Input: 'MYSTRING' Sa�da/Output: 'False'.</remarks>
    class function ContainsLowerCase(AString: String): Boolean;

///<summary>Verifica se existe caracteres mai�sculos.</summary>
///<summary>Checks for uppercase characters.</summary>
///<param name="AString">String a ser verificada. String to be checked.</param>
///<returns>Retorna se a string cont�m caracteres mai�sculos. Returns whether the string contains uppercase characters.</returns>
///<remarks>Entrada/Input: 'MyString' Sa�da/Output: 'True'.</remarks>
///<remarks>Entrada/Input: 'mystring' Sa�da/Output: 'False'.</remarks>
    class function ContainsUpperCase(AString: String): Boolean;
  end;

implementation

{ TMyString }

class function TMyString.RemoveCharacters(ACharacters, AString: String): String;
var
  LTextClear: TStringBuilder;
  LCharLetter: Char;
begin
  LTextClear := TStringBuilder.Create;
  try
    for LCharLetter in AString do
      if Pos(AnsiUpperCase(LCharLetter), ACharacters.ToUpper) = 0  then
        LTextClear.Append(LCharLetter);
    Result := LTextClear.ToString;
  finally
    FreeAndNil(LTextClear);
  end;
end;

class function TMyString.OnlyNumber(AString: String): String;
var
  LIndex: Integer;
begin
  Result := '';
  for LIndex := 0 to Length(AString) - 1 do
    if (CharInSet(AString.Chars[LIndex], ['0'..'9'])) then
      Result := Result + AString.Chars[LIndex];
end;

class function TMyString.SeparateText(AString: String; ASeparator: Char): TStringList;
begin
  AString := StringReplace(AString, ', ', ',', [rfReplaceAll, rfIgnoreCase]);
  Result := TStringList.Create;
  Result.StrictDelimiter := True;
  Result.Delimiter := ASeparator;
  Result.DelimitedText := AString;
end;

class function TMyString.WordCount(AString: String): Integer;
var
  LCount: Integer;
  LIndex: Integer;
  LLen: Integer;
begin
  LLen := Length(AString);
  LCount := 0;
  LIndex := 1;
  while LIndex <= LLen do
  begin
    while ((LIndex <= LLen) and ((AString[LIndex] = #32) or (AString[LIndex] = #9) or (AString[LIndex] = ';'))) do
      Inc(LIndex);
    if LIndex <= LLen then
      Inc(LCount);
    while ((LIndex <= LLen) and ((AString[LIndex] <> #32) and (AString[LIndex] <> #9) and (AString[LIndex] <> ';'))) do
      Inc(LIndex);
  end;
  WordCount := LCount;
end;

class function TMyString.CountPos(const ASubString: String; AString: String): Integer;
begin
  if (Length(ASubString) = 0) or (Length(AString) = 0) or (Pos(ASubString, AString) = 0) then
    Result := 0
  else
    Result := (Length(AString) - Length(StringReplace(AString, ASubString, '', [rfReplaceAll]))) div Length(ASubString);
end;

class function TMyString.MyTryStrToInt(AString: String): Integer;
begin
  Result := 0;
  try
    if not TryStrToInt(AString, Result) then
      Result := 0;
  except
    Result := 0;
  end;
end;

class function TMyString.RemoveCharSpecial(AString: String): String;
var
  LString1, LString2: String;
  LIndex: Integer;
begin
  LString1 := AString;
  LString2 := '';
  for LIndex := 1 to Length(LString1) do
    if (CharInSet(LString1[LIndex], ['0'..'9'])) or
       (CharInSet(LString1[LIndex], ['a'..'z'])) or
       (CharInSet(LString1[LIndex], ['A'..'Z'])) then
      LString2 := LString2 + LString1[LIndex];
  Result := LString2;
end;

class function TMyString.CharIsNum(AChar: Char): Boolean;
begin
  Result := CharInSet(AChar, ['0'..'9'] );
end;

class function TMyString.RemoveAccents(AString: String): String;
const
  LWithAccents = '��������������������������������';
  LNoAccents = 'aaaeouaoaeioucueAAAEOUAOAEIOUCUE';
var
  LIndex: Integer;
begin
  for LIndex := 1 to Length(AString) do
    if Pos(AString[LIndex], LWithAccents) <> 0 then
      AString[LIndex] := LNoAccents[Pos(AString[LIndex],LWithAccents)];
    Result := AString;
end;

class function TMyString.ContainsLowerCase(AString: String): Boolean;
var
  LIndex: Integer;
begin
  Result := False;
  for LIndex := 1 to AString.Length do
    if AString[LIndex] in ['a'..'z'] then
    begin
      Result := True;
      Break;
    end;
end;

class function TMyString.ContainsUpperCase(AString: String): Boolean;
var
  LIndex: Integer;
begin
  Result := False;
  for LIndex := 1 to AString.Length do
    if AString[LIndex] in ['A'..'Z'] then
    begin
      Result := True;
      Break;
    end;
end;

end.
