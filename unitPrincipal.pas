unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

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
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edtId: TEdit;
    Label2: TLabel;
    edtDescricao: TEdit;
    Label3: TLabel;
    edtEan: TEdit;
    Label4: TLabel;
    edtPrecoVenda: TEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BotaoNovo;
    procedure BotaoSalvar;
    procedure BotaoEditar;
    procedure BotaoCancelar;
    procedure BotaoExcluir;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

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
   btnNovo.Enabled := true;
   btnSalvar.Enabled := true;
   btnEditar.Enabled := false;
   btnCancelar.Enabled := false;
   btnExcluir.Enabled := false;
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
end;

procedure TForm1.btnEditarClick(Sender: TObject);
begin
  BotaoEditar
end;

procedure TForm1.btnExcluirClick(Sender: TObject);
begin
  BotaoExcluir;
end;

procedure TForm1.btnNovoClick(Sender: TObject);
begin
  BotaoNovo;
end;

procedure TForm1.btnSalvarClick(Sender: TObject);
begin
  BotaoSalvar;
end;

end.
