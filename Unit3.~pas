unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1, DB, DBTables;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ad: TEdit;
    soyad: TEdit;
    tcno: TEdit;
    sebep: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Label6: TLabel;
    hastaDB: TTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tcnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form1.Close;
end;




procedure TForm3.tcnoKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then key := #0;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
memo1.Text:= '';
memo1.Lines.Add('Ad' + chr(9)+ chr(9) + 'Soyad' + chr(9)+ chr(9) + 'T.C. No' + chr(9)+ chr(9)+ chr(9) + 'Sebep');
memo1.Lines.Add('-----' + chr(9)+ chr(9) + '----------' + chr(9)+ chr(9) + '------------' + chr(9)+ chr(9)+ chr(9) + '----------');
hastaDB.Open;
hastaDB.First;

while not (hastaDB.Eof) do begin
memo1.Lines.Add(hastaDB['ad']+ chr(9)+ chr(9) + hastaDB['soyad'] + chr(9)+ chr(9) + hastaDB['tcno'] + chr(9)+ chr(9)+ hastaDB['sebep']);
hastaDB.Next;
end;

hastaDB.Close;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
hastaDB.Open;
hastaDB.Append;

if (ad.Text = '') then begin
showmessage('Hasta adý giriniz!');
exit;
end;
if (soyad.Text = '') then begin
showmessage('Hasta soyadý giriniz!');
exit;
end;

if (tcno.Text = '') then begin
showmessage('Hasta T.C. NO giriniz!');
exit;
end;

if (sebep.Text = '') then begin
showmessage('Müracaat sebebi giriniz!');
exit;
end;

if not (ad.Text = '') then hastaDB['ad'] := ad.Text;
if not (soyad.Text = '') then hastaDB['soyad'] := soyad.Text;
if not (tcno.Text = '') then hastaDB['tcno'] := tcno.Text;
if not (sebep.Text = '') then hastaDB['sebep'] := sebep.Text;
hastaDB.Post;
hastaDB.Close;




if not ((ad.Text = '') or (soyad.Text = '') or (tcno.Text = '') and (sebep.Text = '')) then begin 
memo1.Lines.Add(ad.Text + chr(9)+ chr(9) + soyad.Text + chr(9)+ chr(9) + tcno.Text + chr(9)+ chr(9) + sebep.Text);
end;

showmessage('Kayýt baþarýlý.');
ad.Text    := '';
soyad.Text := '';
tcno.Text  := '';
sebep.Text := '';
end;



end.
