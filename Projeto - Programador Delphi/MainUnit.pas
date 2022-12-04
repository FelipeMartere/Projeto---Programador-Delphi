unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, StdCtrls, Menus, uLkJSON, ComCtrls, ExtCtrls, JSONObject, Grids,
  ValEdit, DBGrids, DB, DBTables, DBCtrls, DBClient;

type
  TMainForm = class(TForm)
    btn1: TButton;
    idhtp1: TIdHTTP;
    cbb1: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lst1: TListBox;
    pnl1: TPanel;
    lst2: TListBox;
    lbl3: TLabel;
    pnl2: TPanel;
    ds2: TClientDataSet;
    ds2ID: TStringField;
    ds2Nome: TStringField;
    dbgrd1: TDBGrid;
    dataSource1: TDataSource;
    btn2: TButton;
    pnl3: TPanel;
    procedure btn1Click(Sender: TObject);
    procedure GETCategoria();
    procedure GETMontadoras();
    procedure GETVeiculos();
    //procedure SelecionaMontadora();
    procedure FormShow(Sender: TObject);
    procedure lst1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }


  public
    { Public declarations }
      procedure  SetCategoria(url : String);

  end;

var
  MainForm: TMainForm;
  i,j : Integer;
  ListaIdMontadora : TStringList;
implementation

{$R *.dfm}

procedure TMainForm.btn1Click(Sender: TObject);
begin
   GETMontadoras();
   lst2.Clear;
   end;

procedure TMainForm.GETCategoria();

var  JSONRest : string;
    JsonObject : UJSONObject;
    objJSON, Items, Item: TlkJSONbase;
    i : Integer;
begin

   JsonObject := UJSONObject.Create;

  JSONRest := idhtp1.Get('http://service.tecnomotor.com.br/iRasther/tipo?pm.platform=1&pm.version=23');
  objJSON := TlkJSON.ParseText(JSONRest);
  JsonObject.categoria := objJSON;
  for i :=0 to JsonObject.categoria.Count-1 do
  begin
    Item := JsonObject.categoria.Child[0];
    Items := JsonObject.categoria.Child[i];
    cbb1.Items.Add(Items.Value);
    cbb1.Text := VarToStr(Item.Value);
  end;

  //JsonObject := UJSONObject.Create;
   //JsonObject.GetCategoria();

end;

procedure TMainForm.GETMontadoras();
var categoria, url, jsonGet: String;
    objJSONMontadoras, ItemsMontadora, nomeMontadora, idMontadora: TlkJSONbase;
    i,j : Integer;
begin
  lst1.Clear;
  url := 'http://service.tecnomotor.com.br/iRasther/montadora?pm.platform=1&pm.version=23&pm.type=';
  categoria := cbb1.text;

  jsonGet := idhtp1.Get(url+categoria);
  objJSONMontadoras := TlkJSON.ParseText(jsonGet);

  ListaIdMontadora := TStringList.Create;
  j := i+1;
  for i :=0 to objJSONMontadoras.Count -1 do
  begin

    ItemsMontadora := objJSONMontadoras.Child[i];
    nomeMontadora := ItemsMontadora.Field['nome'];
    idMontadora := ItemsMontadora.Field['id'];
    lst1.Items.Add(nomeMontadora.Value);
    //lst2.Items.Add(idMontadora.Value);

    ListaIdMontadora.Add(VarToStr(nomeMontadora.Value));

      if (j >= i) then
      begin
         ListaIdMontadora.Add(VarToStr(idMontadora.Value));
      end;

    j := j+1;
  end;

end;

procedure TMainForm.GETVeiculos();
var categoria, url, jsonGet, idVeiculo : String;
    objJSONMontadoras,objJSONVeiculo, ItemsMontadora, idListVeiculo: TlkJSONbase;
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
    idListVeiculo := ItemsMontadora.Field['id'];
    idVeiculo := idListVeiculo.Value;

    //lst2.Items.Add(nomeMontadora.Value);
    {
      for j:= 0 to lst1.items.count -1 do
      begin

        if(lst1.Items.Strings[j] <> '' )then
        begin
          pnl1.Caption := lst1.Items.Strings[lst1.ItemIndex];
          lst1.Repaint;
        end;
      end;
      }

  end;

end;

procedure TMainForm.FormShow(Sender: TObject);
var
  JsonObject : UJSONObject;
begin
  //SetCategoria('http://service.tecnomotor.com.br/iRasther/tipo?pm.platform=1&pm.version=23');
  GETCategoria();
  //JsonObject := UJSONObject.Create;
   //JsonObject.GetCategoria();
end;

procedure TMainForm.lst1Click(Sender: TObject);
var i,k: Integer;
    IdMontadora, url, categoria, jsonGet : String;
    objJSONMontadoras, ItemsMontadora, nomeMontadora, idMontadoraJSON: TlkJSONbase;
begin

  lst2.Clear;
  lbl3.Visible := True;
  lst2.Visible := True;
  for i:= 0 to lst1.Count-1 do
  begin
    {
    if(lst1.Items.Strings[i] <> '' )then
    begin
      pnl1.Caption := lst1.Items.Strings[lst1.ItemIndex];
      pnl2.Caption := IntToStr(ListaIdMontadora.IndexOf(lst1.Items.Strings[lst1.ItemIndex]));
      pnl3.Caption := ListaIdMontadora[ListaIdMontadora.IndexOf(lst1.Items.Strings[lst1.ItemIndex])+1];
      lst1.Repaint;
      IdMontadora := ListaIdMontadora[ListaIdMontadora.IndexOf(lst1.Items.Strings[lst1.ItemIndex])+1];
    end;
    }
    IdMontadora := ListaIdMontadora[ListaIdMontadora.IndexOf(lst1.Items.Strings[lst1.ItemIndex])+1];
    categoria := cbb1.text;
    lst2.Clear;
    url := 'http://service.tecnomotor.com.br/iRasther/veiculo?pm.platform=1&pm.version=23&pm.type='+categoria+'&pm.assemblers='+idMontadora;

    jsonGet := idhtp1.Get(url);
    objJSONMontadoras := TlkJSON.ParseText(jsonGet);

    //ListaIdMontadora := TStringList.Create;
    //j := i+1;
    for k :=0 to objJSONMontadoras.Count -1 do
    begin

      ItemsMontadora := objJSONMontadoras.Child[k];
      nomeMontadora := ItemsMontadora.Field['nome'];
      //idMontadoraJSON := ItemsMontadora.Field['id'];
      lst2.Items.Add(nomeMontadora.Value);
    end;


  end;
   //ShowMessage(url);

end;

procedure TMainForm.SetCategoria(url: String);
var
  JsonObject : UJSONObject;
  objJSON, Items, Item: TlkJSONbase;
  JSONRest, Categoria : String;
begin

  JsonObject := UJSONObject.Create;
  JSONRest := idhtp1.Get(url);
  objJSON := TlkJSON.ParseText(JSONRest);
  JsonObject.categoria := objJSON;


end;

procedure TMainForm.btn2Click(Sender: TObject);
begin
  {
    ds2.Insert;
     ds2.FieldByName('ID').AsString := idMontadora.Value;
     ds2.FieldByName('Nome').AsString := nomeMontadora.Value;
     ds2.Post;
      }

      {
      for j :=0 to ListaIdMontadora.Count -1  do
      begin

         ShowMessage(ListaIdMontadora.Strings[j]);
      end;
       }
        ShowMessage(IntToStr(ListaIdMontadora.IndexOf('VW')));


end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ListaIdMontadora.Free;
end;

end.
