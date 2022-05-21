unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, DB, DBTables, Grids, DBGrids, ExtCtrls,
  DBCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    kAdi: TEdit;
    sifre: TEdit;
    Button1: TButton;
    userData: TTable;
    procedure kAdiKeyPress(Sender: TObject; var Key: Char);
    procedure sifreKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.kAdiKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then key := #0;
end;

procedure TForm1.sifreKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then key := #0;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
kGiris : string;
sGiris : string;
dGiris : bool;

begin
kGiris := kAdi.Text;
sGiris := sifre.Text;
dGiris := false;

userData.Open;
userData.First;

while not (userData.Eof) do begin
  if (kGiris = userData['kullaniciadi']) and (sGiris = userData['sifre']) then begin
  dGiris := true;
  end;
userData.Next;
end;



if (dGiris = true) then begin
  if (strtoint(MidStr(kGiris,1,1)) = 1) then begin
  Form2.Show;
  Form1.Visible := false;
  end;

  if (strtoint(MidStr(kGiris,1,1)) = 2) then begin
  Form3.Show;
  Form1.Visible := false; 
  end;
end;


if (dGiris = false) then showmessage('Kullanýcý Adý veya Þifre hatalý!');

userData.Close;
end;

end.
