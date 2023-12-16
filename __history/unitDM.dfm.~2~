object DM: TDM
  OldCreateOrder = False
  Height = 668
  Width = 954
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=dbcadproduto'
      'User_Name=root'
      'Password=p@ssw0rd'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 64
  end
  object QryProdutos: TFDQuery
    Active = True
    Connection = FDConn
    SQL.Strings = (
      'select * from produtos')
    Left = 56
    Top = 136
    object QryProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QryProdutosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 60
    end
    object QryProdutosean: TIntegerField
      FieldName = 'ean'
      Origin = 'ean'
      Required = True
    end
    object QryProdutospreco_venda: TBCDField
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Required = True
      Precision = 10
      Size = 2
    end
  end
  object dsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 144
    Top = 136
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Adriano Santos\Documents\Projetos Delphi\Cadastro Produ' +
      'tos\libmySQL.dll'
    Left = 840
    Top = 48
  end
end
