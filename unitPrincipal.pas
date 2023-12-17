unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Mask;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    Button6: TButton;
    edtPesquisar: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    dbgProdutos: TDBGrid;
    Label1: TLabel;
    edtId: TEdit;
    Label2: TLabel;
    edtDescricao: TEdit;
    Label3: TLabel;
    edtEan: TEdit;
    Label4: TLabel;
    masDataValidade: TMaskEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BotaoNovo;
    procedure BotaoSalvar;
    procedure BotaoEditar;
    procedure BotaoCancelar;
    procedure BotaoExcluir;
    procedure HabilitarEdits;
    procedure LimparCampos;
    procedure InserirEdits;
    procedure EditarEdits;
    procedure PopularEdits;
    procedure ExcluirRegistro;
    procedure Pesquisar;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses unitDM;

procedure TForm1.BotaoCancelar;
begin
  btnNovo.Enabled := true;
  btnSalvar.Enabled := true;
  btnEditar.Enabled := true;
  btnCancelar.Enabled := true;
  btnExcluir.Enabled := false;

end;

procedure TForm1.BotaoEditar;
begin
  btnNovo.Enabled := false;
  btnSalvar.Enabled := true;
  btnEditar.Enabled := true;
  btnCancelar.Enabled := true;
  btnExcluir.Enabled := false;
end;

procedure TForm1.BotaoExcluir;
begin
   btnNovo.Enabled := false;
   btnSalvar.Enabled := false;
   btnEditar.Enabled := false;
   btnCancelar.Enabled := false;
   btnExcluir.Enabled := true;
end;

procedure TForm1.BotaoNovo;
begin
   btnNovo.Enabled := true;
   btnSalvar.Enabled := true;
   btnEditar.Enabled := false;
   btnCancelar.Enabled := true;
   btnExcluir.Enabled := false;
end;

procedure TForm1.BotaoSalvar;
begin
  btnNovo.Enabled := false;
  btnSalvar.Enabled := true;
  btnEditar.Enabled := false;
  btnCancelar.Enabled := true;
  btnExcluir.Enabled := false;
end;

procedure TForm1.btnCancelarClick(Sender: TObject);
begin
  BotaoCancelar;
  if MessageDlg('Deseja cancelar o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     LimparCampos;
end;

procedure TForm1.btnEditarClick(Sender: TObject);
begin
  HabilitarEdits;
  BotaoEditar;
  PopularEdits;
end;

procedure TForm1.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
  begin
    BotaoExcluir;
    ExcluirRegistro;
    Pesquisar;
  end;
end;

procedure TForm1.btnNovoClick(Sender: TObject);
begin
  BotaoNovo;
  HabilitarEdits;
end;

procedure TForm1.btnSalvarClick(Sender: TObject);
begin
  if MessageDlg('Deseja salvar o registro?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
  begin
     if trim(edtId.Text) = '' then
        InserirEdits
     else
          EditarEdits;

     LimparCampos;
     BotaoSalvar;
     Pesquisar;
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 Pesquisar;
end;

procedure TForm1.EditarEdits;
begin
  with DM.QryProdutos do
    begin
      close;
      SQL.Clear;
      SQL.Add('update produtos                 ' +
          '    set descricao = :pdescricao,    ' +
          '    ean           = :pean,          ' +
          '    data_validade = :pdata_validade ' +
          '    where id      = :pid            ');

      ParamByName('pid').AsInteger := StrToInt(edtId.Text);
      ParamByName('pdescricao').AsString := edtDescricao.Text;
      ParamByName('pdata_validade').AsDate := StrToDate(masDataValidade.text);
      ParamByName('pean').AsString := edtEan.Text;

      try
        ExecSQL;
          ShowMessage('Altera��o feita com sucesso');
      except on E: Exception do
        raise Exception.Create('Erro na Altera��o do registro!' + E.Message);
      end;

    end;
end;

procedure TForm1.ExcluirRegistro;
var
  lID : Integer;
begin
  lID := DM.QryProdutos.FieldByName('id').AsInteger;

  with DM.QryProdutos do
    begin
      close;
      SQL.Clear;
      SQL.Add('delete from produtos where id = :pid');
      ParamByName('pid').AsInteger :=  lID;
      ExecSQL;
      MessageDlg('Registro deletado com sucesso', mtInformation, [mbOK], 0);
    end;
end;

procedure TForm1.HabilitarEdits;
begin
  edtDescricao.Enabled := true;
  edtDescricao.Enabled := true;
  edtEan.Enabled := true;
  masDataValidade.Enabled  := true;
end;

procedure TForm1.InserirEdits;
begin
  with DM.QryProdutos do
    begin
      close;
      SQL.Clear;
      SQL.Add('insert into produtos (descricao, ean, data_validade) values ');
      SQL.Add('(:pdescricao, :pean, :pdata_validade)');
      ParamByName('pdescricao').AsString := edtDescricao.Text;
      ParamByName('pean').AsInteger := StrToInt(edtEan.Text);
      ParamByName('pdata_validade').AsDate := StrToDate(masDataValidade.Text);
      ExecSQL;
    end;
end;

procedure TForm1.LimparCampos;
begin
  edtiD.Text := '';
  edtDescricao.Text := '';
  edtEan.Text := '';
  masDataValidade.Text := '';
end;

procedure TForm1.Pesquisar;
begin
  DM.QryProdutos.Close;
  DM.QryProdutos.SQL.Clear;

  DM.QryProdutos.SQL.Text := 'select * from produtos where descricao like ' +  QuotedStr('%' + edtPesquisar.Text + '%') ;
  DM.QryProdutos.Open();
end;

procedure TForm1.PopularEdits;
begin
  edtId.Text              := DM.QryProdutos.FieldByName('ID').AsString;
  edtDescricao.Text       := DM.QryProdutos.FieldByName('DESCRICAO').AsString;
  edtEan.Text             := DM.QryProdutos.FieldByName('EAN').AsString;
  masDataValidade.Text    := DM.QryProdutos.FieldByName('DATA_VALIDADE').AsString;

end;

end.




