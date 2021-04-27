unit Classe.Lista.CupomItem;

interface

uses
  Classes, Classe.CupomFiscalItem;

type
  TListaCupomItem = class
  private
    FListaCupomItem : TList;
  public
    constructor create;
    destructor destroy; override;
    procedure Adicionar(Value : TCupomItemControle);
  end;

implementation

{ TListaCupomItem }

procedure TListaCupomItem.Adicionar(Value: TLevaPaga);
begin
  FListaCupomItem.Add(Value);
end;

constructor TListaCupomItem.create;
begin
  FListaCupomItem := TList.Create;
end;

destructor TListaCupomItem.destroy;
begin

  inherited;
end;

end.
