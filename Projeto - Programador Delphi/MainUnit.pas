unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, StdCtrls, Menus, uLkJSON;

type
  TMainForm = class(TForm)
    btn1: TButton;
    idhtp1: TIdHTTP;
    cbb1: TComboBox;
    lbl1: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure GETCategoria();
    procedure FormShow(Sender: TObject);

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
var JSONRest : String;
    objJSON, Item: TlkJSONbase;
    i : Integer;
begin
  JSONRest := idhtp1.Get('http://service.tecnomotor.com.br/iRasther/tipo?pm.platform=1&pm.version=23');
  objJSON := TlkJSON.ParseText(JSONRest);

  for i :=0 to objJSON.Count-1 do
  begin
    Item := objJSON.Child[i];
    cbb1.Items.Add(Item.Value);
  end;

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

procedure TMainForm.FormShow(Sender: TObject);
begin
  GETCategoria();
end;

end.
