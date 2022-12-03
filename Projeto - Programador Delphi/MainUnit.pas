unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, StdCtrls, Menus, uLkJSON, ComCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    btn1: TButton;
    idhtp1: TIdHTTP;
    cbb1: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lst1: TListBox;
    pnl1: TPanel;
    procedure btn1Click(Sender: TObject);
    procedure GETCategoria();
    procedure GETMontadoras();
    procedure SelecionaMontadora();
    procedure FormShow(Sender: TObject);
    procedure lst1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btn1Click(Sender: TObject);
begin
   GETMontadoras();
end;

procedure TMainForm.GETCategoria();
var JSONRest : String;
    objJSON, Items, Item: TlkJSONbase;
    i : Integer;
begin

  JSONRest := idhtp1.Get('http://service.tecnomotor.com.br/iRasther/tipo?pm.platform=1&pm.version=23');
  objJSON := TlkJSON.ParseText(JSONRest);

  for i :=0 to objJSON.Count-1 do
  begin
    Item := objJSON.Child[0];
    Items := objJSON.Child[i];
    cbb1.Items.Add(Items.Value);
    cbb1.Text := VarToStr(Item.Value);
  end;

end;

procedure TMainForm.GETMontadoras();
var categoria, url, jsonGet : String;
    objJSONMontadoras, ItemsMontadora, nomeMontadora: TlkJSONbase;
    i,j : Integer;
begin
  lst1.Clear;
  url := 'http://service.tecnomotor.com.br/iRasther/montadora?pm.platform=1&pm.version=23&pm.type=';
  categoria := cbb1.text;

  jsonGet := idhtp1.Get(url+categoria);
  objJSONMontadoras := TlkJSON.ParseText(jsonGet);

  for i :=0 to objJSONMontadoras.Count -1 do
  begin
    ItemsMontadora := objJSONMontadoras.Child[i];
    nomeMontadora := ItemsMontadora.Field['nome'];
    lst1.Items.Add(nomeMontadora.Value);


  end;


end;

procedure TMainForm.SelecionaMontadora();
var i : Integer;
begin



end;


procedure TMainForm.FormShow(Sender: TObject);
begin
  GETCategoria();
end;

procedure TMainForm.lst1Click(Sender: TObject);
var i: Integer;

begin
  for i:= 0 to lst1.items.count -1 do
  begin

    if(lst1.Items.Strings[i] <> '' )then
    begin
      pnl1.Caption := lst1.Items.Strings[lst1.ItemIndex];
      lst1.Repaint;
    end;
  end;
end;

end.
