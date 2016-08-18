unit uCriaHorarioMensal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, System.StrUtils, Vcl.Mask, JvExMask, JvToolEdit, Vcl.Buttons, Pessoa, Departamento, Convenio;

type
  TfrmCriaHorarioMensal = class(TfrmPadrao)
    gridDiasSemana: TDBGrid;
    cdsDiasSemana: TClientDataSet;
    dsDiasSemana: TDataSource;
    cdsDiasSemanaDIA_SEMANA: TStringField;
    cdsDiasSemanaSELECAO: TStringField;
    cmbHora: TComboBox;
    cmbMinutos: TComboBox;
    cdsDiasSemanaHORA: TStringField;
    cdsDiasSemanaMINUTOS: TStringField;
    dtpDataInicial: TJvDateEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    lbTitulo: TLabel;
    lbProfissional: TLabel;
    lbPessoa: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    procedure gridDiasSemanaCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure gridDiasSemanaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure cdsDiasSemanaAfterEdit(DataSet: TDataSet);
  private
    FPessoa :TPessoa;
    FProfissional :TPessoa;
    FDepartamento :TDepartamento;
    FConvenio :TConvenio;

    procedure iniciaGridDias;
  public
    constructor create(AOwner: TComponent; pProfissional, pPessoa :TPessoa; pDepartamento :TDepartamento; pConvenio :TConvenio); overload;
  end;

var
  frmCriaHorarioMensal: TfrmCriaHorarioMensal;

implementation

{$R *.dfm}

procedure TfrmCriaHorarioMensal.cdsDiasSemanaAfterEdit(DataSet: TDataSet);
begin
  inherited;
//verificar tela do smart pra nao deixar alterar campo no grid

end;

constructor TfrmCriaHorarioMensal.create(AOwner: TComponent; pProfissional, pPessoa: TPessoa; pDepartamento: TDepartamento; pConvenio :TConvenio);
begin
  inherited Create(AOwner);
  FPessoa          := pPessoa;
  FProfissional    := pProfissional;
  FDepartamento    := pDepartamento;
  FConvenio        := pConvenio;
  lbTitulo.Caption := 'CRIANDO HORÁRIO ('+FDepartamento.departamento+')';
  lbProfissional.Caption := FProfissional.Nome;
  lbPessoa.Caption := FPessoa.Nome;
end;

procedure TfrmCriaHorarioMensal.FormCreate(Sender: TObject);
begin
  inherited;
  iniciaGridDias;
end;

procedure TfrmCriaHorarioMensal.gridDiasSemanaCellClick(Column: TColumn);
begin
  if Column.PickList.Count > 0 then
  begin
    keybd_event(VK_F2,0,0,0);
    keybd_event(VK_F2,0,KEYEVENTF_KEYUP,0);
    keybd_event(VK_MENU,0,0,0);
    keybd_event(VK_DOWN,0,0,0);
    keybd_event(VK_DOWN,0,KEYEVENTF_KEYUP,0);
    keybd_event(VK_MENU,0,KEYEVENTF_KEYUP,0);
  end;

  if (Column.FieldName = 'SELECAO') or (Column.FieldName = 'DIA_SEMANA') then
  begin
    cdsDiasSemana.Edit;
    cdsDiasSemanaSELECAO.AsString := IfThen(cdsDiasSemanaSELECAO.AsString = 'S', 'N', 'S');
    cdsDiasSemana.Post;

//    gridDiasSemana.Columns[2].PickList.indexof('00');
    gridDiasSemana.Columns[3].PickList.indexof('00');
  end;

  gridDiasSemana.Columns[2].ReadOnly := cdsDiasSemanaSELECAO.AsString <> 'S';
  gridDiasSemana.Columns[3].ReadOnly := cdsDiasSemanaSELECAO.AsString <> 'S';

  if gridDiasSemana.SelectedIndex in [0,1] then
     gridDiasSemana.Options := gridDiasSemana.Options - [dgEditing]
  else
     gridDiasSemana.Options := gridDiasSemana.Options + [dgEditing];
end;

procedure TfrmCriaHorarioMensal.gridDiasSemanaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  iCheck: Integer;
  rRect: TRect;
begin
  if cdsDiasSemanaSELECAO.AsString = 'S' then
    gridDiasSemana.Canvas.Brush.Color:= $00D5ECCA
  else
    gridDiasSemana.Canvas.Brush.Color:= clWhite;

  gridDiasSemana.Canvas.FillRect(Rect);
  gridDiasSemana.DefaultDrawDataCell(Rect, Column.Field, State);

  if (Column.FieldName = 'HORA') or (Column.FieldName = 'MINUTOS') then
  begin
    if cdsDiasSemanaSELECAO.AsString = 'S' then
    begin
       gridDiasSemana.Canvas.Brush.Color := clWhite;
       gridDiasSemana.Canvas.Font.Color  := clBlack;       
    end
    else
    begin
      gridDiasSemana.Canvas.Brush.Color  := clBtnFace;
      gridDiasSemana.Canvas.Font.Color   := clBtnFace;      
    end;

    gridDiasSemana.Canvas.FillRect(Rect);
    gridDiasSemana.DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  //Desenha um checkbox no dbgrid
  if Column.FieldName = 'SELECAO' then
  begin
    gridDiasSemana.Canvas.FillRect(Rect);
    iCheck := 0;
    if cdsDiasSemanaSELECAO.AsString = 'S' then
      iCheck := DFCS_CHECKED
    else
      iCheck := 0;

    rRect := Rect;
    InflateRect(rRect,-2,-2);
    DrawFrameControl(gridDiasSemana.Canvas.Handle,rRect,DFC_BUTTON, DFCS_BUTTONCHECK or iCheck);
  end;
end;

procedure TfrmCriaHorarioMensal.iniciaGridDias;
const
  dias : array[1..6] of string = ('SEGUNDA-FEIRA','TERÇA-FEIRA','QUARTA-FEIRA','QUINTA-FEIRA','SEXTA-FEIRA','SÁBADO-FEIRA');
var
  i :integer;
begin
  cdsDiasSemana.CreateDataSet;

  gridDiasSemana.Columns[2].PickList := cmbHora.Items;
  gridDiasSemana.Columns[3].PickList := cmbMinutos.Items;

  for i := 1 to 6 do
  begin
    cdsDiasSemana.Append;
    cdsDiasSemanaDIA_SEMANA.AsString := dias[i];
    cdsDiasSemanaHORA.AsString       := '00';
    cdsDiasSemanaMINUTOS.AsString    := '00';    
    cdsDiasSemana.Post;
  end;
end;

end.
