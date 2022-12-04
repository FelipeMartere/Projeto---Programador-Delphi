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
    lst2.Items.Add(idMontadora.Value);

    //lst1.Items[i] := lst2.Items[i];
     //ShowMessage(lst1.Items[i]);

     {ds2.Insert;
     ds2.FieldByName('ID').AsString := idMontadora.Value;
     ds2.FieldByName('Nome').AsString := nomeMontadora.Value;
     ds2.Post;
     }
      //dbgrd1.Columns[0].FieldName := 'Id';
      //dbgrd1.Columns[1].FieldName := 'Nome';
      ListaIdMontadora.Add(VarToStr(idMontadora.Value));

      if (j >= i) then
      begin
         ListaIdMontadora.Add(VarToStr(nomeMontadora.Value));
      end;

        j := j+1;
  end;


   {
   lst1.Columns := 2;
  for i :=0 to objJSONMontadoras.Count -1 do
  begin
    ItemsMontadora := objJSONMontadoras.Child[i];
    idMontadora := ItemsMontadora.Field['Id'];
    lst1.Items.Add(idMontadora.Value);
  end;
  }


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
var i: Integer;

begin

    //GETVeiculos();
  
  for i:= 0 to lst1.items.count -1 do
  begin

    if(lst1.Items.Strings[i] <> '' )then
    begin
      pnl1.Caption := lst1.Items.Strings[lst1.ItemIndex];
      lst1.Repaint;
    end;
  end

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
      for j :=0 to ListaIdMontadora.Count -1 do
      begin
         ShowMessage(ListaIdMontadora.Strings[j]);
      end;


end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ListaIdMontadora.Free;
end;

end.
