unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1, DB, DBTables, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    hastaDB: TTable;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Button1: TButton;
    Memo2: TMemo;
    yonlendirme: TTable;
    Edit1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form1.Close;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
hastaDB.Open;
hastaDB.First;
yonlendirme.Open;
yonlendirme.First;
memo1.Text := '';
memo2.Text := '';
memo1.Lines.Add('Ad' + chr(9)+ chr(9) + 'Soyad' + chr(9)+ chr(9) + 'T.C. No' + chr(9)+ chr(9)+ chr(9) + 'Sebep');
memo1.Lines.Add('-----' + chr(9)+ chr(9) + '----------' + chr(9)+ chr(9) + '------------' + chr(9)+ chr(9)+ chr(9) + '----------');
memo2.Lines.Add('Ad' + chr(9)+ chr(9) + 'Soyad' + chr(9)+ chr(9) + 'T.C. No' + chr(9)+ chr(9)+ chr(9) + 'Sebep' + chr(9)+ chr(9)+ chr(9) + 'Yönlendirilme');
memo2.Lines.Add('-----' + chr(9)+ chr(9) + '----------' + chr(9)+ chr(9) + '------------' + chr(9)+ chr(9)+ chr(9) + '----------'+ chr(9)+ chr(9)+ chr(9) + '----------------');

while not (hastaDB.Eof) do begin
combobox1.Items.Add(hastaDB['tcno']);
memo1.Lines.Add(hastaDB['ad'] + chr(9)+ chr(9) + hastaDB['soyad'] + chr(9)+ chr(9) + hastaDB['tcno'] + chr(9)+ chr(9) + hastaDB['sebep']);
hastaDB.Next;
end;

while not (yonlendirme.Eof) do begin
memo2.Lines.Add(yonlendirme['ad'] + chr(9)+ chr(9) + yonlendirme['soyad'] + chr(9)+ chr(9) + yonlendirme['tcno'] + chr(9)+ chr(9) + yonlendirme['sebep'] + chr(9) + chr(9) + chr(9) +yonlendirme['yonlendirilme']);
yonlendirme.Next;
end;

hastaDB.Close;
yonlendirme.Close;


end;

procedure TForm2.Button1Click(Sender: TObject);
var
tcno : string;
line : integer;
begin

if (combobox1.ItemIndex) < 0 then begin
showmessage('Hasta T.C. NO seçiniz!');
exit;                                      
end;

if (combobox2.ItemIndex) < 0 then begin
showmessage('Yönlendirme seçiniz!');
exit;                                      
end;  

hastaDB.Open;
yonlendirme.Open;
yonlendirme.Append;
hastaDB.First;
tcno := combobox1.Items.Strings[combobox1.itemindex];
line := (combobox1.ItemIndex + 2);

if (combobox1.ItemIndex < 0) then begin
showmessage('Hasta T.C. NO seçiniz!');
exit;                                      
end;

if  (combobox2.ItemIndex = 0) then begin
 if (edit1.Text = '') then begin
  showmessage('Ýlaç bilgisi giriniz!');
  exit;
 end; 
end; 

while not (hastaDB.Eof) do begin
  if (tcno = hastaDB['tcno']) then begin
  yonlendirme['ad'] := hastaDB['ad'];
  yonlendirme['soyad'] := hastaDB['soyad'];
  yonlendirme['tcno'] := hastaDB['tcno'];
  yonlendirme['sebep'] := hastaDB['sebep'];
  if (combobox2.ItemIndex = 0) then (yonlendirme['yonlendirilme'] := edit1.Text);
  if not(combobox2.ItemIndex = 0) then yonlendirme['yonlendirilme'] := combobox2.Items.Strings[combobox2.ItemIndex];
  yonlendirme.Post;
  memo2.Lines.Add(yonlendirme['ad'] + chr(9)+ chr(9) + yonlendirme['soyad'] + chr(9)+ chr(9) + yonlendirme['tcno'] + chr(9)+ chr(9) + yonlendirme['sebep'] + chr(9)+ chr(9)+ chr(9) + yonlendirme['yonlendirilme']);
  hastaDB.Delete;
  memo1.Lines.Delete(line);
    
  end;
  
hastaDB.Next;

end;

combobox1.Items.Delete(combobox1.ItemIndex);
combobox2.ItemIndex := -1;
label4.Visible := false;
edit1.Visible  := false;
edit1.Text := '';
showmessage('Yönlendirme baþarýlý.');
combobox1.Text := 'Seçiniz..';
combobox2.Text := 'Seçiniz..';
hastaDB.Close;

end;

procedure TForm2.ComboBox2Change(Sender: TObject);
begin
if  (combobox2.ItemIndex = 0) then begin
label4.Visible := true;
edit1.Visible  := true;
end;

end;


end.
