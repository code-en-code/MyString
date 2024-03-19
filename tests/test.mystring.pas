unit test.mystring;

interface

uses
  TestFramework,

  //delphi
  System.AnsiStrings,
  System.SysUtils,
  System.Classes,

  //codeencode
  mystring;

type
  TestTMyString = class(TTestCase)
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestRemoveCharacters;
    procedure TestOnlyNumber;
    procedure TestSeparateText;
    procedure TestWordCount;
    procedure TestEmptyWordCount;
    procedure TestCountPos;
    procedure TestRemoveCharSpecial;
    procedure TestCharIsNumTrue;
    procedure TestCharIsNumFalse;
    procedure TestRemoveAccents;
    procedure TestContainsLowerCaseTrue;
    procedure TestContainsLowerCaseFalse;
    procedure TestContainsUpperCaseTrue;
    procedure TestContainsUpperCaseFalse;
  end;

implementation

procedure TestTMyString.SetUp;
begin

end;

procedure TestTMyString.TearDown;
begin

end;

procedure TestTMyString.TestRemoveCharacters;
var
  ReturnValue: String;
  AString: String;
  ACharacters: String;
begin
  ACharacters := '!@#$%&*()';
  AString := '(My !@# clean $%&* string.)';
  ReturnValue := TMyString.RemoveCharacters(ACharacters, AString);
  CheckEquals('My  clean  string.', ReturnValue, 'TestRemoveCharacters failed.');
end;

procedure TestTMyString.TestOnlyNumber;
var
  ReturnValue: String;
  AString: String;
begin
  AString := 'A1b2C3d4E5f6G7H8I9';
  ReturnValue := TMyString.OnlyNumber(AString);
  CheckEquals('123456789', ReturnValue, 'TestOnlyNumber failed.');
end;

procedure TestTMyString.TestSeparateText;
var
  ReturnValue: TStringList;
  ASeparator: Char;
  AString: String;
  Item: String;
begin
  AString := 'Value, Value, Value';
  ASeparator := ',';
  ReturnValue := TMyString.SeparateText(AString, ASeparator);
  for Item in ReturnValue do
    CheckEquals('Value', Item, 'TestSeparateText failed.');
end;

procedure TestTMyString.TestWordCount;
var
  ReturnValue: Integer;
  AString: String;
begin
  AString := 'Lorem ipsum proin phasellus non mollis eleifend himenaeos leo, ' +
            'mattis vivamus sit dictum leo sociosqu ad mattis eget, hac sed ' +
            'sagittis fringilla adipiscing conubia hac.';
  ReturnValue := TMyString.WordCount(AString);
  CheckEquals(25, ReturnValue, 'TestWordCount failed.');
end;

procedure TestTMyString.TestEmptyWordCount;
var
  ReturnValue: Integer;
  AString: String;
begin
  AString := '';
  ReturnValue := TMyString.WordCount(AString);
  CheckEquals(0, ReturnValue, 'TestEmptyWordCount failed. Not returned 0.');
end;

procedure TestTMyString.TestCountPos;
var
  ReturnValue: Integer;
  AString: String;
  ASubString: String;
begin
  ASubString := 'leo';
  AString := 'Lorem ipsum proin phasellus non mollis eleifend himenaeos leo, ' +
                'mattis vivamus sit dictum leo sociosqu ad mattis eget, hac sed ' +
                'sagittis fringilla adipiscing conubia hac.';
  ReturnValue := TMyString.CountPos(ASubString, AString);
  CheckEquals(2, ReturnValue, 'TestCountPos failed.');
end;

procedure TestTMyString.TestRemoveCharSpecial;
var
  ReturnValue: String;
  AString: String;
begin
  AString := 'A*1#3!B';
  ReturnValue := TMyString.RemoveCharSpecial(AString);
  CheckEquals('A13B', ReturnValue, 'TestRemoveCharSpecial failed.');
end;

procedure TestTMyString.TestCharIsNumTrue;
var
  ReturnValue: Boolean;
  AChar: Char;
begin
  AChar := '1';
  ReturnValue := TMyString.CharIsNum(AChar);
  CheckEquals(True, ReturnValue, 'TestCharIsNumTrue failed.');
end;

procedure TestTMyString.TestCharIsNumFalse;
var
  ReturnValue: Boolean;
  AChar: Char;
begin
  AChar := 'A';
  ReturnValue := TMyString.CharIsNum(AChar);
  CheckEquals(False, ReturnValue, 'TestCharIsNumFalse failed.');
end;

procedure TestTMyString.TestRemoveAccents;
var
  ReturnValue: String;
  AString: String;
begin
  AString := '‰‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸Ëƒ¿¬ ‘€√’¡…Õ”⁄«‹»';
  ReturnValue := TMyString.RemoveAccents(AString);
  CheckEquals('aaaeouaoaeioucueAAAEOUAOAEIOUCUE', ReturnValue, 'TestRemoveAccents failed.');
end;

procedure TestTMyString.TestContainsLowerCaseTrue;
var
  ReturnValue: Boolean;
  AString: String;
begin
  AString := 'MyString';
  ReturnValue := TMyString.ContainsLowerCase(AString);
  CheckEquals(True, ReturnValue, 'TestContainsLowerCaseTrue failed.');
end;

procedure TestTMyString.TestContainsLowerCaseFalse;
var
  ReturnValue: Boolean;
  AString: String;
begin
  AString := 'MYSTRING';
  ReturnValue := TMyString.ContainsLowerCase(AString);
  CheckEquals(False, ReturnValue, 'TestContainsLowerCaseFalse failed.');
end;

procedure TestTMyString.TestContainsUpperCaseTrue;
var
  ReturnValue: Boolean;
  AString: String;
begin
  AString := 'MyString';
  ReturnValue := TMyString.ContainsUpperCase(AString);
  CheckEquals(True, ReturnValue, 'TestContainsUpperCaseTrue failed.');
end;

procedure TestTMyString.TestContainsUpperCaseFalse;
var
  ReturnValue: Boolean;
  AString: String;
begin
  AString := 'mystring';
  ReturnValue := TMyString.ContainsUpperCase(AString);
  CheckEquals(False, ReturnValue, 'TestContainsUpperCaseFalse failed.');
end;

initialization
  RegisterTest(TestTMyString.Suite);

end.

