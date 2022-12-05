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
    lbl3: TLabel;
    lvMontadoras: TListView;
    lvVeiculos: TListView;
    lvMotorizacao: TListView;
    lbl4: TLabel;
    lvTipoSistemas: TListView;
    lbl5: TLabel;
    lvSistemas: TListView;
    lbl6: TLabel;
    edt1: TEdit;
    procedure GETCategoria();
    procedure GETMontadoras();
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lvMontadorasSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure lvVeiculosSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure cbb1Change(Sender: TObject);
    procedure lvMotorizacaoSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure lvTipoSistemasSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure lvSistemasSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);

  private
    { Private declarations }


  public
    { Public declarations }


  end;

var
  MainForm: TMainForm;
  i,j : Integer;
  ListaIdMontadora : TStringList;
  IdMontadoraNovo, idVeiculoString, idMotorizacaoString, idTipoSistemasString, nomeMontadoraStatus, nomeVeiculoStatus, nomeMotorizacaoStatus, nomeTipoSistemasStatus, nomeSistemasStatus : String;
implementation

{$R *.dfm}


procedure TMainForm.GETCategoria();
var  JSONRest : string;
    JsonObject : UJSONObject;
    objJSON, Items: TlkJSONbase;
    i : Integer;

begin

  JsonObject := UJSONObject.Create;
  JSONRest := idhtp1.Get('http://service.tecnomotor.com.br/iRasther/tipo?pm.platform=1&pm.version=23');
  objJSON := TlkJSON.ParseText(JSONRest);
  JsonObject.categoria := objJSON;

  for i :=0 to JsonObject.categoria.Count-1 do
  begin
    //Item := JsonObject.categoria.Child[0];
    Items := JsonObject.categoria.Child[i];
    cbb1.Items.Add(Items.Value);

  end;

end;

procedure TMainForm.GETMontadoras();
var categoria, url, jsonGet: String;
    objJSONMontadoras, ItemsMontadora, nomeMontadora, idMontadora: TlkJSONbase;
    j : Integer;
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

procedure TMainForm.FormShow(Sender: TObject);
var
  JsonObject : UJSONObject;
begin

  GETCategoria();

end;


procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ListaIdMontadora.Free;
end;

procedure TMainForm.lvMontadorasSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
  var
  i: Integer;
     url, categoria, jsonGet : String;
    objJSONVeiculos, ItemsVeiculos, nomeVeiculo, idVeiculo: TlkJSONbase;
    ListaVeiculos : TListItem;
begin

   if(lvMotorizacao.Visible = True)then
  begin
    lbl4.Visible := False;
    lvMotorizacao.Visible := False;
    lbl5.Visible := False;
    lvTipoSistemas.Visible := False;
    lbl6.Visible := False;
    lvSistemas.Visible := False;
  end;

  IdMontadoraNovo := Item.Caption;
  nomeMontadoraStatus := Item.SubItems.Text;
  lbl3.Visible := True;
  lvVeiculos.Visible := True;

  categoria := cbb1.text;
  lvVeiculos.Clear;
  url := 'http://service.tecnomotor.com.br/iRasther/veiculo?pm.platform=1&pm.version=23&pm.type='+categoria+'&pm.assemblers='+IdMontadoraNovo;

  jsonGet := idhtp1.Get(url);
  objJSONVeiculos := TlkJSON.ParseText(jsonGet);

  for i :=0 to objJSONVeiculos.Count -1 do
  begin

    ItemsVeiculos := objJSONVeiculos.Child[i];
    nomeVeiculo := ItemsVeiculos.Field['nome'];
    idVeiculo := ItemsVeiculos.Field['id'];
    ListaVeiculos := lvVeiculos.Items.Add;
    ListaVeiculos.Caption := idVeiculo.Value;
    ListaVeiculos.SubItems.Add(nomeVeiculo.Value);

  end;
   edt1.Text := cbb1.Text + '/' + nomeMontadoraStatus;
end;

procedure TMainForm.lvVeiculosSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
  var
    i: Integer;
     url, categoria, jsonGet, indexVeiculo : String;
    objJSONMotorizacao, ItemsMotorizacao, nomeMotorizacao, idMotorizacao: TlkJSONbase;
    ListaMotorizacao : TListItem;
begin
    if(lvTipoSistemas.Visible = True)then
    begin
      lbl5.Visible := False;
      lvTipoSistemas.Visible := False;
      lbl6.Visible := False;
      lvSistemas.Visible := False;
    end;

    idVeiculoString := Item.Caption;
    nomeVeiculoStatus := Item.SubItems.Text;
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
    edt1.Text := cbb1.Text + '/' + nomeMontadoraStatus + '/' + nomeVeiculoStatus;


end;


procedure TMainForm.cbb1Change(Sender: TObject);
begin

  lvMontadoras.Clear;
  lvVeiculos.Clear;
  lbl3.Visible := False;
  lvVeiculos.Visible := False;
  lvMotorizacao.Clear;
  lbl4.Visible := False;
  lvMotorizacao.Visible := False;
  lvTipoSistemas.Clear;
  lbl5.Visible := False;
  lvTipoSistemas.Visible := False;
  lvSistemas.Clear;
  lbl6.Visible := False;
  lvSistemas.Visible := False;
  GETMontadoras();

end;

procedure TMainForm.lvMotorizacaoSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
  var
    i: Integer;
     url, categoria, jsonGet, indexVeiculo : String;
    objJSONTipoSistemas, ItemsTipoSistemas, nomeTipoSistema, idTipoSistemas: TlkJSONbase;
    ListaTipoSistemas : TListItem;
begin
     if(lvSistemas.Visible = True)then
     begin
      lbl6.Visible := False;
      lvSistemas.Visible := False;
     end;

    idMotorizacaoString := Item.Caption;
    nomeMotorizacaoStatus := Item.SubItems.Text;
    lbl5.Visible := True;
    lvTipoSistemas.Visible := True;
    categoria := cbb1.text;
    lvTipoSistemas.Clear;

    url := 'http://service.tecnomotor.com.br/iRasther/tiposistema?pm.platform=1&pm.version=23&pm.type='+categoria+'&pm.assemblers='+IdMontadoraNovo+'&pm.vehicles='+idVeiculoString+'&pm.engines='+idMotorizacaoString;

    jsonGet := idhtp1.Get(url);
    objJSONTipoSistemas := TlkJSON.ParseText(jsonGet);

    for i :=0 to objJSONTipoSistemas.Count -1 do
    begin

      ItemsTipoSistemas := objJSONTipoSistemas.Child[i];
      nomeTipoSistema := ItemsTipoSistemas.Field['nome'];
      idTipoSistemas := ItemsTipoSistemas.Field['id'];

      ListaTipoSistemas := lvTipoSistemas.Items.Add;
      ListaTipoSistemas.Caption := idTipoSistemas.Value;
      ListaTipoSistemas.SubItems.Add(nomeTipoSistema.Value);

    end;
    edt1.Text := cbb1.Text + '/' + nomeMontadoraStatus + '/' + nomeVeiculoStatus + '/' + nomeMotorizacaoStatus;

end;

procedure TMainForm.lvTipoSistemasSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
    i: Integer;
     url, categoria, jsonGet, indexVeiculo : String;
    objJSONSistemas, ItemsSistemas, nomeSistema, idSistemas: TlkJSONbase;
    ListaSistemas : TListItem;
begin
  idTipoSistemasString := Item.Caption;
  nomeTipoSistemasStatus := Item.SubItems.Text;

  lbl6.Visible := True;
  lvSistemas.Visible := True;
  categoria := cbb1.text;
  lvSistemas.Clear;

  
    url := 'http://service.tecnomotor.com.br/iRasther/sistema?pm.platform=1&pm.version=23&pm.type='+categoria+'&pm.assemblers='+idMontadoraNovo+'&pm.vehicles='+idVeiculoString+'&pm.engines='+idMotorizacaoString+'&pm.typeOfSystems='+idTipoSistemasString;

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

    edt1.Text := cbb1.Text + '/' + nomeMontadoraStatus + '/' + nomeVeiculoStatus + '/' + nomeMotorizacaoStatus + '/' + nomeTipoSistemasStatus;
end;

procedure TMainForm.lvSistemasSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  nomeSistemasStatus := Item.SubItems.Text;
  edt1.Text := cbb1.Text + '/' + nomeMontadoraStatus + '/' + nomeVeiculoStatus + '/' + nomeMotorizacaoStatus + '/' + nomeTipoSistemasStatus + '/' + nomeSistemasStatus;
end;

end.

