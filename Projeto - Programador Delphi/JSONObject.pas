unit JSONObject;

interface
  uses
    uLkJSON;
 type
 UJSONObject = class(TObject)
 private
    {Private Declarations}
    //Atributos e metodos Privados
  FCategoria : TlkJSONbase;
  FIdMontadora : String;
  FIdVeiculo : String;
  FIdMotorizacao : String;
  FIdTipoSistema : String;
  procedure SetCategoria(const Value : TlkJSONbase);
  procedure SetIdMontadora(const Value : String);
  procedure SetIdVeiculo(const Value : String);
  procedure SetIdMotorizacao(const Value : String);
  procedure SetIdTipoSistema(const Value : String);
  //function GetCategoria():TlkJSONbase;
 protected
    {Protected Declarations}
 public
    {Public Declarations}
   //constructor Create; override;
   //destructor Destroy; override;
   property categoria : TlkJSONbase read FCategoria write FCategoria;
   property IdMontadora : string read FIdMontadora write FIdMontadora;
   property IdVeiculo : string read FIdVeiculo write FIdVeiculo;
   property IdMotorizacao : string read FIdMotorizacao write FIdMotorizacao;
   property IdTipoSistema : string read FIdTipoSistema write FIdTipoSistema;
   function GetCategoria() : TlkJSONbase;
   constructor  Create;
   destructor Destroy; override;
 published
   {Published Declarations}
   //property Categoria, IdMontadora, IdVeiculo, IdMotorizacao, IdTipoSistema: string;




 end;
implementation

constructor UJSONObject.Create;
begin
  inherited; 
end;

destructor  UJSONObject.Destroy;
begin

end;

function UJSONObject.GetCategoria(): TlkJSONbase;
var
  JsonObject : UJSONObject;
    objJSON, Items, Item: TlkJSONbase;
    i : Integer;
begin

  for i :=0 to 3 do
  begin
    //Item := JsonObject.categoria.Child[0];
    Items := JsonObject.categoria.Child[i];
    //cbb1.Items.Add(Items.Value);
    //cbb1.Text := VarToStr(Item.Value);
  end;

  Result := Items;

end;

procedure  UJSONObject.SetCategoria(const Value: TlkJSONbase);
begin
  FCategoria := Value;
end;


procedure UJSONObject.SetIdMontadora(const Value: String);
begin
  FIdMontadora := Value;
end;

procedure UJSONObject.SetIdMotorizacao(const Value: String);
begin
  FIdMotorizacao := Value;
end;

procedure UJSONObject.SetIdTipoSistema(const Value: String);
begin
  FIdTipoSistema := Value;
end;

procedure UJSONObject.SetIdVeiculo(const Value: String);
begin
  FIdVeiculo := Value;
end;

end.
