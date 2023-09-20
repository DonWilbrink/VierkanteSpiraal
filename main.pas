unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Spin;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    PaintBox1: TPaintBox;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  X,Y,i: Integer;
begin
  X := PaintBox1.Width div 2;
  Y := PaintBox1.Height div 2;
  with PaintBox1.Canvas do
  begin
    PaintBox1.Canvas.Clear;
    MoveTo(X,Y);
    i := 0;
    while i <= SpinEdit1.Value-1 do
    begin
      X := X-i*10;
      LineTo(X,Y);
      Y := Y+i*10;
      LineTo(X,Y);
      Inc(i);
      X := X+i*10;
      LineTo(X,Y);
      Y := Y-i*10;
      LineTo(X,Y);
      Inc(i);
    end;
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
var
  Y: Integer;
begin
  Y := PaintBox1.Height div 2;
  SpinEdit1.MaxValue := Y div 5 - 5;
  Button1Click(Self);
end;

end.

