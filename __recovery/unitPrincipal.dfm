object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 605
  ClientWidth = 834
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 834
    Height = 89
    Align = alTop
    TabOrder = 0
    object btnNovo: TButton
      Left = 16
      Top = 21
      Width = 75
      Height = 49
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnSalvar: TButton
      Left = 97
      Top = 21
      Width = 75
      Height = 49
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    object btnEditar: TButton
      Left = 178
      Top = 21
      Width = 75
      Height = 49
      Caption = 'Editar'
      TabOrder = 2
      OnClick = btnEditarClick
    end
    object btnCancelar: TButton
      Left = 259
      Top = 21
      Width = 75
      Height = 49
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object btnExcluir: TButton
      Left = 340
      Top = 21
      Width = 75
      Height = 49
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = btnExcluirClick
    end
    object Button6: TButton
      Left = 749
      Top = 32
      Width = 75
      Height = 28
      Caption = 'Pesquisar'
      TabOrder = 5
    end
    object edtPesquisar: TEdit
      Left = 536
      Top = 35
      Width = 207
      Height = 21
      TabOrder = 6
      Text = 'edtPesquisar'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 834
    Height = 516
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 352
      Width = 832
      Height = 163
      Align = alBottom
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 11
        Height = 13
        Caption = 'ID'
      end
      object Label2: TLabel
        Left = 143
        Top = 24
        Width = 59
        Height = 13
        Caption = 'DESCRI'#199#195'O'
      end
      object Label3: TLabel
        Left = 502
        Top = 24
        Width = 20
        Height = 13
        Caption = 'EAN'
      end
      object Label4: TLabel
        Left = 664
        Top = 24
        Width = 86
        Height = 13
        Caption = 'PRE'#199'O DE VENDA'
      end
      object edtId: TEdit
        Left = 15
        Top = 43
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object edtDescricao: TEdit
        Left = 142
        Top = 43
        Width = 353
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 1
      end
      object edtEan: TEdit
        Left = 501
        Top = 43
        Width = 156
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object edtPrecoVenda: TEdit
        Left = 663
        Top = 43
        Width = 156
        Height = 21
        Enabled = False
        TabOrder = 3
      end
    end
    object DBGrid1: TDBGrid
      Left = 78
      Top = 24
      Width = 665
      Height = 289
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
