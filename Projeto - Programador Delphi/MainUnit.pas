unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, StdCtrls, Menus, uLkJSON, ComCtrls, ExtCtrls, JSONObject, Grids,
  ValEdit, DBGrids, DB, DBTables, DBCtrls, DBClient;

type
  TMainForm = class(TForm)
    idhtp1: TIdHTTP;
    cbb1: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    pnl1: TPanel;
    lbl3: TLabel;
    pnl2: TPanel;
    btn2: TButton;
    pnl3: TPanel;
    lvMontadoras: TListView;
    lvVeiculos: TListView;
    lvMotorizacao: TListView;
    lbl4: TLabel;
    lvSistemas: TListView;
    lbl5: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure GETCategoria();
    procedure GETMontadoras();
    procedure GETVeiculos();
    //procedure SelecionaMontadora();
    procedure FormShow(Sender: TObject);
    procedure lst1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lvMontadorasSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure lvVeiculosSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure cbb1Change(Sender: TObject);
    procedure lvMotorizacaoSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);

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
  IdMontadoraNovo, idVeiculoString, idMotorizacaoString, idSistemas : String;
implementation

{$R *.dfm}

procedure TMainForm.btn1Click(Sender: TObject);
begin
   //GETMontadoras();

   end;

procedure TMainForm.GETCategoria();
var  JSONRest : string;
    JsonObject : UJSONObject;
    objJSON, Items, Item: TlkJSONbase;
    i : Integer;
    Lista_Eventos : TListItem;
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

  end;

end;

procedure TMainForm.GETMontadoras();
var categoria, url, jsonGet: String;
    objJSONMontadoras, ItemsMontadora, nomeMontadora, idMontadora: TlkJSONbase;
    i,j : Integer;
    ListaMontadoras : TListItem;
begin

  url := 'http://service.tecnomotor.com.br/iRasther/montadora?pm.platform=1&pm.version=23&pm.type=';
  categoria := cbb1.text;
  jsonGet := idhtp1.Get(url+categoria);
  objJSONMontadoras := TlkJSON.ParseText(jsonGet);

  for i :=0 to objJSONMontadoras.Count -1 do
  begin

    ItemsMontadora := objJSONMontadoras.Child[i];
    nomeMontadora := ItemsMontadora.Field['nome'];
    idMontadora := ItemsMontadora.Field['id'];
    ListaMontadoras := lvMontadoras.Items.Add;
    ListaMontadoras.Caption := idMontadora.Value;
    ListaMontadoras.SubItems.Add(nomeMontadora.Value);

  end;

end;

procedure TMainForm.GETVeiculos();
var categoria, url, jsonGet, idVeiculo : String;
    objJSONMontadoras,objJSONVeiculo, ItemsMontadora, idListVeiculo: TlkJSONbase;
    i,j : Integer;
begin

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

  GETCategoria();

end;

procedure TMainForm.lst1Click(Sender: TObject);
var i: Integer;
     url, categoria, jsonGet : String;
    objJSONVeiculos, ItemsVeiculos, nomeVeiculo, idVeiculo: TlkJSONbase;
    ListaVeiculos : TListItem;
begin

    lbl3.Visible := True;
    lvVeiculos.Visible := True;

    categoria := cbb1.text;
    lvVeiculos.Clear;
    url := 'http://service.tecnomotor.com.br/iRasther/veiculo?pm.platform=1&pm.version=23&pm.type='+categoria+'&pm.assemblers='+IdMontadoraNovo;

    jsonGet := idhtp1.Get(url);
    objJSONVeiculos := TlkJSON.ParseText(jsonGet);

         // EXEMPLO DE ADI��O NA LISTA
       {
         ListaMontadoras := ListView1.Items.Add;
      ListaMontadoras.Caption := idMontadora.Value;
      ListaMontadoras.SubItems.Add(nomeMontadora.Value);

      ListaIdMontadora.Add(VarToStr(nomeMontadora.Value));
       }

    for i :=0 to objJSONVeiculos.Count -1 do
    begin

      ItemsVeiculos := objJSONVeiculos.Child[i];
      nomeVeiculo := ItemsVeiculos.Field['nome'];
      idVeiculo := ItemsVeiculos.Field['id'];
      ListaVeiculos := lvVeiculos.Items.Add;
      ListaVeiculos.Caption := idVeiculo.Value;
      ListaVeiculos.SubItems.Add(nomeVeiculo.Value);

    end;

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
var
  Lista_Eventos : TListItem;
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
        //ShowMessage(IntToStr(ListaIdMontadora.IndexOf('VW')));
        Lista_Eventos := lvMontadoras.Items.Add;
     //ListView1.Columns.Items[0].Caption := 'ID';
     //ListView1.Columns.Items[1].Caption := 'Nome';
     //ListView1.Columns.Items[2].Caption := 'col 2';

     Lista_Eventos.Caption := ' 29';
      Lista_Eventos.Caption := ' 30';
     //Lista_Eventos.SubItems.Add('29');
     Lista_Eventos.SubItems.Add('ALFA ROMEO');
      Lista_Eventos.SubItems.Add('VW');
                                                                   
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ListaIdMontadora.Free;
end;

procedure TMainForm.lvMontadorasSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
  var
     indexteste : String;
begin
  IdMontadoraNovo := Item.Caption;
  //pnl1.Caption := IdMontadoraNovo;
  lst1Click(Sender);
end;

procedure TMainForm.lvVeiculosSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
  var
    i: Integer;
     url, categoria, jsonGet, indexVeiculo : String;
    objJSONMotorizacao, ItemsMotorizacao, nomeMotorizacao, idMotorizacao: TlkJSONbase;
    ListaMotorizacao : TListItem;
begin
  idVeiculoString := Item.Caption;
  pnl2.Caption := idVeiculoString;

    lbl4.Visible := True;
    lvMotorizacao.Visible := True;

    categoria := cbb1.text;
    lvMotorizacao.Clear;
    url := 'http://service.tecnomotor.com.br/iRasther/motorizacao?pm.platform=1&pm.version=23&pm.type='+categoria+'&pm.assemblers='+IdMontadoraNovo+'&pm.vehicles='+idVeiculoString;

    jsonGet := idhtp1.Get(url);
    objJSONMotorizacao := TlkJSON.ParseText(jsonGet);

    for i :=0 to objJSONMotorizacao.Count -1 do
    begin

      ItemsMotorizacao := objJSONMotorizacao.Child[i];
      nomeMotorizacao := ItemsMotorizacao.Field['nome'];
      idMotorizacao := ItemsMotorizacao.Field['id'];
      ListaMotorizacao := lvMotorizacao.Items.Add;
      ListaMotorizacao.Caption := idMotorizacao.Value;
      ListaMotorizacao.SubItems.Add(nomeMotorizacao.Value);

    end;



end;


procedure TMainForm.cbb1Change(Sender: TObject);
begin

  lvMontadoras.Clear;
  lvVeiculos.Clear;
  lvMotorizacao.Clear;
  lvSistemas.Clear;
  GETMontadoras();
  //ShowMessage(cbb1.Text);
end;

procedure TMainForm.lvMotorizacaoSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
  var
    i: Integer;
     url, categoria, jsonGet, indexVeiculo : String;
    objJSONSistemas, ItemsSistemas, nomeSistema, idSistemas: TlkJSONbase;
    ListaSistemas : TListItem;
begin
  idMotorizacaoString := Item.Caption;
  pnl1.Caption := idMotorizacaoString;

    lbl5.Visible := True;
    lvSistemas.Visible := True;
    categoria := cbb1.text;
    lvSistemas.Clear;

    url := 'http://service.tecnomotor.com.br/iRasther/tiposistema?pm.platform=1&pm.version=23&pm.type='+categoria+'&pm.assemblers='+IdMontadoraNovo+'&pm.vehicles='+idVeiculoString+'&pm.engines='+idMotorizacaoString;

    jsonGet := idhtp1.Get(url);
    objJSONSistemas := TlkJSON.ParseText(jsonGet);

    for i :=0 to objJSONSistemas.Count -1 do
    begin

      ItemsSistemas := objJSONSistemas.Child[i];
      nomeSistema := ItemsSistemas.Field['nome'];
      idSistemas := ItemsSistemas.Field['id'];

      ListaSistemas := lvSistemas.Items.Add;
      ListaSistemas.Caption := idSistemas.Value;
      ListaSistemas.SubItems.Add(nomeSistema.Value);

    end;

     //ShowMessage(url);

end;

end.

