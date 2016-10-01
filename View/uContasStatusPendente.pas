unit uContasStatusPendente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Generics.Collections, uPadrao, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Datasnap.DBClient,
  Vcl.Grids, Vcl.DBGrids, DBGridCBN, SPA, Utilitario, System.StrUtils;

type
  TfrmContasStatusPendente = class(TfrmPadrao)
    DBGridCBN1: TDBGridCBN;
    cdsHorarios: TClientDataSet;
    dsHorarios: TDataSource;
    cdsHorariosDATA: TDateField;
    cdsHorariosPESSOA: TStringField;
    cdsHorariosPROFISSIONAL: TStringField;
    cdsHorariosDIA_SEMANA: TStringField;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnVoltar: TBitBtn;
    Panel1: TPanel;
    Shape1: TShape;
    lbTitulo: TLabel;
    Label3: TLabel;
    cdsHorariosSTATUS: TStringField;
    GroupBox1: TGroupBox;
    chkPendente: TCheckBox;
    chkCompareceu: TCheckBox;
    chkFaltou: TCheckBox;
    chkCancelado: TCheckBox;
    Shape3: TShape;
    Shape2: TShape;
    Shape4: TShape;
    Shape5: TShape;
    cdsHorariosHORA: TStringField;
    cdsHorariosID: TIntegerField;
    cdsHorariosDEPARTAMENTO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure DBGridCBN1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkPendenteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure cdsHorariosAfterEdit(DataSet: TDataSet);
    procedure cdsHorariosAfterScroll(DataSet: TDataSet);
    procedure DBGridCBN1Enter(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    alterando :Boolean;

    procedure alteraStatus(status :String);
    procedure buscaHorarios;
  public
    { Public declarations }
  end;

var
  frmContasStatusPendente: TfrmContasStatusPendente;

implementation

{$R *.dfm}

procedure TfrmContasStatusPendente.alteraStatus(status: String);
begin
  chkPendente.Checked   := false;
  chkCompareceu.Checked := false;
  chkFaltou.Checked     := false;
  chkCancelado.Checked  := false;

  case AnsiIndexStr(UpperCase(status), ['PENDENTE', 'COMPARECEU','FALTOU','CANCELADO']) of
   0 : chkPendente.Checked := true;
   1 : chkCompareceu.Checked := true;
   2 : chkFaltou.Checked := true;
   3 : chkCancelado.Checked := true;
  end;
end;

procedure TfrmContasStatusPendente.btnSalvarClick(Sender: TObject);
var horario :TSPA;
begin
  try
    cdsHorarios.AfterScroll := nil;
    cdsHorarios.First;
    horario := TSPA.Create;
    while not cdsHorarios.Eof do
    begin
      if cdsHorariosSTATUS.AsString <> 'PENDENTE' then
      begin
        horario.Load(cdsHorariosID.AsInteger);

        case AnsiIndexStr(UpperCase(cdsHorariosSTATUS.AsString), ['COMPARECEU','FALTOU','CANCELADO']) of
          0 : horario.compareceu    := 'S';
          1 : horario.compareceu    := 'N';
          2 : horario.tipo          := 'C';
         end;

        horario.Save;
      end;

      cdsHorarios.Next;
    end;
    cdsHorarios.AfterScroll := cdsHorariosAfterScroll;
    avisar('Alterações salvas com sucesso.');

    buscaHorarios;
  finally
    FreeAndNil(horario);
  end;
end;

procedure TfrmContasStatusPendente.btnVoltarClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmContasStatusPendente.buscaHorarios;
var horario :TSPA;
    horarios :TObjectList<TSPA>;
begin
  try
    cdsHorarios.EmptyDataSet;
    horario  := TSPA.Create;
    horarios := horario.LoadList<TSPA>(' WHERE SPA.COMPARECEU = '''' and SPA.TIPO <> ''C'' and '+
                                       '    ((SPA.DATA < '+QuotedStr(StringReplace(DateToStr(Date),'/','.',[rfReplaceAll, rfIgnoreCase]))+')'+
                                       '  or (SPA.DATA = '+QuotedStr(StringReplace(DateToStr(Date),'/','.',[rfReplaceAll, rfIgnoreCase]))+
                                       ' and SPA.HORA < '+QuotedStr(TimeToStr(Time))+'))');

    if assigned(horarios) then
    begin
      for horario in horarios do
      begin
        cdsHorarios.Append;
        cdsHorariosID.AsInteger          := horario.ID;
        cdsHorariosDEPARTAMENTO.AsString := horario.Departamento.departamento;
        cdsHorariosDATA.AsDateTime       := horario.data;
        cdsHorariosHORA.AsString         := TimeToStr(horario.hora);
        cdsHorariosPESSOA.AsString       := horario.Pessoa.Nome;
        cdsHorariosPROFISSIONAL.AsString := horario.Profissional.Nome;
        cdsHorariosDIA_SEMANA.AsString   := TUtilitario.diaSemanaExtenso(horario.data);
        cdsHorariosSTATUS.AsString       := 'PENDENTE';
        cdshorarios.Post;
      end;
    end
    else
    begin
      avisar('Não foram encontrados horários com status "PENDENTE"');
      chkCompareceu.Enabled := false;
      chkFaltou.Enabled     := false;
      chkCancelado.Enabled  := false;
    end;
  finally
    FreeAndNil(horarios);
  end;
end;

procedure TfrmContasStatusPendente.cdsHorariosAfterEdit(DataSet: TDataSet);
begin
  if not btnSalvar.Enabled then
    btnSalvar.Enabled := true;
end;

procedure TfrmContasStatusPendente.cdsHorariosAfterScroll(DataSet: TDataSet);
begin
  alteraStatus(cdsHorariosSTATUS.AsString);
end;

procedure TfrmContasStatusPendente.chkPendenteClick(Sender: TObject);
var NovoStatus :String;
begin
  if alterando then
    exit;

  alterando := true;

  if not TCheckBox(Sender).Checked then
  begin
    chkPendente.Checked := true;
    NovoStatus := 'PENDENTE';
  end
  else
  begin
     chkPendente.Checked   := false;
     chkCompareceu.Checked := false;
     chkFaltou.Checked     := false;
     chkCancelado.Checked  := false;

     TCheckBox(Sender).Checked := true;

     NovoStatus := TCheckBox(Sender).Caption;
  end;

  cdsHorarios.Edit;
  cdsHorariosSTATUS.AsString := NovoStatus;
  cdsHorarios.Post;

  alterando := false;
end;

procedure TfrmContasStatusPendente.DBGridCBN1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  With TDBGridCBN(Sender) do
  begin
    if Column.FieldName = 'STATUS' then
    begin
      if DataSource.DataSet.FieldByName('STATUS').AsString = 'PENDENTE' then
      begin
        Canvas.Brush.Color := clWhite;
        Canvas.Font.Color  := clBlack;
      end
      else if DataSource.DataSet.FieldByName('STATUS').AsString = 'COMPARECEU' then
      begin
        Canvas.Brush.Color := $009AD19D;
        Canvas.Font.Color  := clBlack;
      end
      else if DataSource.DataSet.FieldByName('STATUS').AsString = 'FALTOU' then
      begin
        Canvas.Brush.Color := $00242CB0;
        Canvas.Font.Color  := clSilver;
      end
      else if DataSource.DataSet.FieldByName('STATUS').AsString = 'CANCELADO' then
      begin
        Canvas.Brush.Color := $00D9E6FF;
        Canvas.Font.Color  := clBlack;
      end;

      Canvas.FillRect(Rect);
      DefaultDrawDataCell(Rect, columns[datacol].field, State);
    end;
  end;
end;

procedure TfrmContasStatusPendente.DBGridCBN1Enter(Sender: TObject);
begin
  cdsHorariosAfterScroll(nil);
end;

procedure TfrmContasStatusPendente.FormCreate(Sender: TObject);
begin
  inherited;
  cdsHorarios.CreateDataSet;
  alterando := false;
end;

procedure TfrmContasStatusPendente.FormShow(Sender: TObject);
begin
  buscaHorarios;
end;

end.
