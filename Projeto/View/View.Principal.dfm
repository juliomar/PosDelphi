<<<<<<< HEAD
object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object STGridPessoa: TStringGrid
    Left = 0
    Top = 422
    Width = 906
    Height = 82
    Align = alBottom
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
    Visible = False
  end
  object DBGridClientes: TDBGrid
    Left = 0
    Top = 108
    Width = 906
    Height = 280
    Align = alClient
    DataSource = DataSourceClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sobrenome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Matricula'
        Visible = True
      end>
  end
  object pnConsulta: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 32
    Width = 900
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 21
      Width = 96
      Height = 13
      Caption = 'Campos p/ pesquisa'
    end
    object Label2: TLabel
      Left = 159
      Top = 21
      Width = 73
      Height = 13
      Caption = 'Texto Pesquisa'
    end
    object Label3: TLabel
      Left = 375
      Top = 21
      Width = 96
      Height = 13
      Caption = 'Op'#231#245'es de pesquisa'
    end
    object cbCampo: TComboBox
      Left = 8
      Top = 39
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object editTextoPesquisa: TEdit
      Left = 159
      Top = 39
      Width = 210
      Height = 21
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 375
      Top = 39
      Width = 145
      Height = 21
      TabOrder = 2
    end
    object btnPesquisar: TButton
      Left = 526
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 3
    end
  end
  object pnAcoes: TPanel
    Left = 0
    Top = 388
    Width = 906
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object BitBtnExportarAlunosXLS: TBitBtn
      Left = 77
      Top = 4
      Width = 120
      Height = 25
      Caption = 'Exportar para XLS'
      TabOrder = 0
      OnClick = BitBtnExportarAlunosXLSClick
    end
    object BitBtnExportarAlunosHTML: TBitBtn
      Left = 197
      Top = 3
      Width = 120
      Height = 25
      Caption = 'Exportar para HTML'
      TabOrder = 1
      OnClick = BitBtnExportarAlunosHTMLClick
    end
    object btnEditar: TButton
      Left = 2
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 906
    Height = 29
    ButtonWidth = 273
    Caption = 'ToolBar1'
    TabOrder = 4
  end
  object ClientDataSetClientes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Sobrenome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Matricula'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    IndexFieldNames = 'Id'
    Params = <>
    StoreDefs = True
    Left = 92
    Top = 166
    object ClientDataSetClientesId: TIntegerField
      FieldName = 'Id'
    end
    object ClientDataSetClientesNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object ClientDataSetClientesSobrenome: TStringField
      FieldName = 'Sobrenome'
      Size = 50
    end
    object ClientDataSetClientesMatricula: TStringField
      FieldName = 'Matricula'
    end
  end
  object DataSourceClientes: TDataSource
    DataSet = ClientDataSetClientes
    Left = 204
    Top = 166
  end
  object MainMenu1: TMainMenu
    Left = 712
    object esste1: TMenuItem
      Caption = ' Formas de pagamento'
      OnClick = esste1Click
    end
  end
end
object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 423
  ClientWidth = 853
  Color = clInfoBk
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelClientes: TLabel
    Left = 73
    Top = 23
    Width = 55
    Height = 19
    Caption = 'Alunos:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ImageAluno: TImage
    Left = 1
    Top = 0
    Width = 64
    Height = 73
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000400000
      00400806000000AA6971DE000014694944415478DAD59B079855D5B5C7FFA7DC
      36B74D1F8632C050872282A858025FD004C58E150388DFD31890F8107B215882
      068D092F05DF335149F0BD449FC686E6431345A52845513A338E30CC30FDCEDC
      5E4ED96FED73CFBD73E7CE30B4E17D93037B4EBB779FFDFFEDB5D65EE7EC7305
      9CA625D769C7F8C1A528F07A20C8164892045912218A0204A64D84AE4F1004A1
      5414452B638C76F5664114778A92B491BEAE1BC7340DAAA2A0D1E7C796CAC388
      C4955E6FA7703AC44F18528271245E1765304184AA034A423D4B639897EF755E
      E4703AC7927830A683E93AF83689A77DFA5C2C561F8B865EA2A6AD1204F10843
      1284A62AF8EADB3A54D5B7F66D0053C7946158691134124E82A1AADA994C909E
      B339DDD3154585A4C59088458FFA7D8BD506BBDB43A2F5442C14789E003E4687
      DB0D8B50551C6C6CC5B6AADABE0960CAC801A81854025D90A8379940BDBB54B0
      39972614556E6FF743D319BC0EF9B8EA12C95D6C2E2F3425D1405631977CE71F
      29B7D85659839AE6F6BE05A034CF854B268DA05E273F176021B3FEAB2AD96729
      912062090D71F2038D04B8EDC70720B548B215A2C5AA29B1F03C06F17F380485
      E2C2BA2FF741D1F4BE0360E6A4E128F4BAA9460192803FABA275AEA8C6105774
      433C5F739770DAA4136F24C50748564D57E31793FEF53C76EC3A588F6F1B4E3D
      1EF40A807C9703579D33CA0876B228CC8931694D8EA81926CFC5C74C08BCC372
      6CE249B694DC0AA824B7AA202BD01ADA02D872A0A66F0018519A8FF3470F22BF
      1764EAE56FAD9250462E4C401812243E665800A37D1D0EEB895B406AD198001A
      2B2EA731F2BDD660189BF61EEC1B002695F7C3B8B2123EC6CF8CABEC3DA735D9
      CB290B489ABF8073C70E464D830F475A02270980A200F02C557BBF8F03D8D787
      008C4F02784AD1D843764B12806E0228CCF3E06272918A91C5686A0961CDDAED
      A83B190804802CEC756AF4F5DC0236F72500670CA6E18FE1158B24FC8827367C
      91C80F268C1C8CF32695A3B8C48DD4F12375ED7877FD6EECA8ACE329DF095D8B
      BC683DB5FAFBBEBE0660C2907E7C0058230AC21C7ECC6EB560E6D409A8A81808
      BBC3DAE53B81F60876EFABC3D707EAD0D8164424964034A1227AAC7497B1750C
      C225AD81303EDFDF87009C39B41FAFECD7D4CB8BF9B1EF4F198BE9D326D01076
      F44BF0313DE88F201A8E53C6A852DEAF214A206A8EF8F0CDB747B0EF501358D7
      2FBD427FE7B606237D0BC0440240CB0202B08ADFF4DC7BE7B5707B9C27551F23
      5FF2B5F8B175FB01FCED936FA0A899090F7B8CFE3CEEEB4B00F830388D223C2D
      13A8ECE8579487BB165C77CAB52BE40E7F7B6703DEDFB43B433FAEA0BF6B7DA1
      08BEE82B00781A7CD9592352F5D58F1A5156327FEE15BD5135DA5ADA70CFF23F
      A5AC40A352C40F1F6A6AC5DEC38D7D03005F6EBB78A2B1B6D9ACAB86950F5C30
      6FEE95BD5331C5894797BF84EF6A5BF8CEA7F4671A6FF6AE4375A86BF5F71D00
      179F3114438A73515C5C70B6DBEDDCF2E3DB6FECADAAF11FCFFF2F3EFF6A3F87
      7127EDAEE2C3E9A7BB2A69D438F50724BD06201507CE3C730C5A5ADA3EBFEBDF
      6F3DB7B7EAFEFD1FFF864F37ED88C8B2D45F55357F281AA71CA0BA57EAEE3500
      5659C28D178CC1F9E74DE2C3DB55B3AEBBEC2D9BCDD62B753FFDABD5385055F3
      3C0D930B6389040ED436A2A6D9D7B700F0853F10997FED0F70CE94C9282C2AD8
      EEF17A26F546BD4B1E7C2E9E9FE719B3675F757582CC7EFDCEFD507BE15940AF
      0370D9AD5879FF2D9831F30770BADD0B24495A75AA75524ED0BEE4C1675E9830
      6EE403EF7FF0190E53F4DF5353DF6B6DEEF56782CB16DF82BBEFF811DDBECBB9
      14AC784BEDA7525F73B36FED77076B6757551D0CBDFEE63A6CD85D89582F04BF
      D30660FCE861D8F8CE1F0051E64F72FE9B2E71F3A9D4A72ACAC24020F8FC679F
      7D81C77FF907541E39F5B1FFB402E0CBC6775FC419632B0880348DEE90D69F4A
      5D4CD787315DABFE74E3165C3DFF1EE3A14A9F07B0F0D61BF1CCB27BC80A44D2
      2F7D4957997872EAB186C4CF230AB8FFF1E7B0EAE5577BBDADA70580D7E3C29E
      4D6B91EBF57208E79225F00CCE7A429530EC20F11792F8300730E592D9D8B9E7
      C0BF0600BEFCD7AF9EC0DC1BAFA6B6ABFCB1EE15A225E7F5E387C0AA7435368D
      CF0CF15478CDAB6FE18E253F3B2DED3C6D00BC1E37D6BDF132C60E2DE1935B60
      89E8566BE1B0C982D8F3BC809E08438F874650CBAA44AB0BDFECD98F19B3E6C3
      1F08FE6B01E0CB830B67E38105B3290E88165D89F845D9EEB0150E8768F774FB
      792DDC8278EBB720E10440A80A46358C9D76C331C51752AC79BCB01065393948
      3D74978CB94686E79B9BF14E28F4FF0FC0EB76E29B0F5F822787A701FA4564D6
      FF489D939DC5B0E40E80687118FB7A220AA5BD066A2439D12108F22C06F62681
      C3E5B73E8C0D5B77F678AD270B0A30DEED36C48B74A3C48B604CD00806888FDB
      DAF0AB961644BA79FE78DA003CB4682E1E58482900D3F858F6321D9ADFE5E272
      F25E81A9F1EC537F2229F3214A0884A2B8F09A05A8A9EB7EFCFFB74183F0433E
      DAF0E151D72BF2DDEE3FCB82E08DC6E34B345D5F2B4B122C546AA3512CABAFC7
      41553DFD002ACA0761F3DA17A97646FF593F6AD97738B18C304100C651375652
      00A5385085FB9FF80D36EFD8DBE9438B162DC265656508AF5B87C491232E7722
      B1CDE7F78FE29650E8F1308B2CAF88C4E38F10009D83E013AB2B1A1AF0512472
      7A0038DC5E4C9FB71897DF740B267842E827079127459E97C07E72A27591B17E
      1563960B43BA2DD2A4E4E0B09A87773FF808EFFDEE31F88E1CC2B9932AB0F237
      BF47ACC987E8973B1079E38DD7FC2D2DD76B24922C003CD4BA1C0EE47B3CEB03
      A1D04D745FD2C82D41246B59DBDA8A177C3EC3257A0DC00F6FB913972E7A1276
      572EF5BA8E5CDD8FD14AE5CC7267E45D0838A9094185491F5545DC73AAE5C1F5
      01C1055DB4F247EFD8F1EE4B983B6817060C1D8FF6801DED5ADE9AC0071FCE39
      B87A3524129502C0D75612DDAFA0A021128BDDA8EBFAA72908BBDADBB184E2C2
      2903C81F7926C6CF7F08C3478EC690D26238EC39B0596D6E9B24DDCB98FEC0F8
      F81EDB58671BDD1A9CD8B43837D7FD6137764AA3DA34D9BE4263EC777155092B
      4A1C5AA419E7699F60A42340BD987F653346BDAD3301D1DDBB71E0A9A7A051D0
      33206494A2DC5C8D02E3C39168F4190E804FB15F4B31E1A401D8F34B30FA8645
      289D38D578EFC7669151E4F548E3CACB7E2259DDCB907C78692C79F1269C2154
      63A03D0EC9DA732EA4AB0A1AC222BE46399A6DFD334FB5302DF64C6D63FD6F15
      7F6DEC2C5B15CEF636E5F677C4BF8CA8C2D026FB455005375412BF7BD932B4EF
      D8D109009F92F5D0304916F0622491B88D03BEB1B1F1E40094CF9C87C1D3AF83
      D3E3319E04F150A2323643D3F1EB8AB2928A492387221097F95459A7C5996843
      7FBD09C562085E21069BA01843565C17116076B4E84ED40AC508D80ABB5CD36B
      6738DC508FCD7B0F1E29B4447FF6C3FCEAD5338A1BDEB468BE2BD47823F56818
      91925BA0B92619AFD21C58B50A952FBFDC09005FDB2D16959A65E1EF26CD6E6A
      3A3100AE01E51833E77EE40E1E411549C6184B220793F0DFE43AAD5706629A21
      DAE5B0E3FC318391E7CD47307E6A5EE6A29132186AC7967D35680D848CE4A6C0
      65C174F78186EB8B76F4D348BC6A165DA3DB86D29BC106DEC1A7EAD1B07E3DB6
      3CF820F460D068AB1917D6910B5CC261DC7C2200064EBB1A23AE5D001BF5B895
      C4933F490995DDE3715897B9EC724E7348315E80E0C98B68DC058A28CD77E3CC
      E1FDE1747808C4F18BE681CE65630804FDD8F95D03EA7D41E38D320A62C67A9C
      DB87A5E51B28654E896FA054836283D24E690741F09E8778D972589D2508D5D4
      E0F3254B10DEBF9F27460D56179948385C6FA18BCCA3D1E0980024BB13C3AEF9
      31064C9901BB5536DEF5D374368E0690D5A5B9396705622A42D4F349D114EE45
      290D41345F7F2BF23A317240010A73BD642132E82B5DDC43A671C261A1048082
      5C535B3B2A8FF8E00FC78CD7E874433C33C47BA4289E1DB91E6EED70527C82F7
      3C7D8E5107245A785665B8A4E49E88D6BC3BC19C1546CFEF5CB182450F565FA4
      F9831F2B870FA38A62C0338140CF00B8F833163E8DDCB21186781EEC12AABEC4
      EBB43D9563B3D81AFD74613EC619623B7A3E73CD8FF30952BEE6D3E5859E1C8A
      C83970DAACC6CB93C9979E54F82324BC3D8C403491169D5CB374CFF3AC72E9D0
      0D1865399061F641AADF41E29BC9F7931325B29DD26C7E4C0DA3C97E3582AE2B
      9123EB6F367EF8C1ACD64DDB51BF71239692F8684F7900173F6EC17243BC83C4
      932237895F33A0C07D5528AA80F77C5274B2973B0024C759E3782708498BE880
      933CCF1766F6708768DD9820D553666F1E9B5DBC0B97E76E498B579556C8D622
      32FD366834D230968064C92700FDE9989F8004A804E1B7CFD81CB39F73A92A0E
      F3C79AA2983D670EEA342DE96E470330EC86BBD0EFEC8BE1B059B8690F20B35F
      37A8D033B6BE3D025563494119662EA6C54AE6B91E00A4BE77020026BAEA7077
      FF0FA0993EAF9260D946B7DA7A827ABFC980208876D85CA3C92A42B41F302C42
      D312B54171E844661DD212725D854FB737E3BEFBEEEB8837DD89F7948FC5983B
      7E6E3496C6CD7C6AE917030B3DC3EB7C21E32B1D828E6601199F49C706134446
      EFA7DE18E16ED011E492269F09A19052EA27CBDE815D3D9CEE7D51F652711BE2
      390C1E046D9E330C3731841B00024A4D62E0D406A5E4F33CD98F43872CB8F3E9
      9D0865DC1E770BA0E2C74F1084F1664385F7F3DD3997062209233C7708CB0691
      E1F75966DE215EC8E87D2119EE930492C2F93A25DE042141C5D281EFA14CDC9F
      16CF9B6D758E488BD712ADC63E076288A7A21380979AAF89B6A88593016D4F8B
      928F7FBEF216EAB76FEC3CE2648BCF291D8271773D976CAC20CCA5F2E7AEC1AD
      272B90BA8817D2E0CC63A6F8D4C559DA0A98F90275873BCC2FDE84698ECF8D68
      CF4D5FA7C0E6C83DDBF071959B3E01102D5E581D4348B869F6746E5360347ED9
      B880EE0D94CFEC426C6A50CB41EBEE2DA87AE5999E010CBA6C3EFA5D70391764
      A1935524A0AC93904C9FCE02918690E1F342170066C9BAB4211E260413C0F9AE
      4ADC5EF05E7AACE7C39C23FF3C8358527C237D56819D4C5FA360A79B006AA30E
      DC5FFB30C2AA2D0994B1EF51AD1BD448185F3D794BCF0046DDF618993FBF1517
      6EA2F2976E4D5914BA04B76C08D9BE9E068094F9230D810B37FEA7AD80A1BF85
      929DD2BF4056EAD2E3BDCD3D9E025F3FA3D75533F0D9DDE3E8F36A3AEA471351
      3C58BB0487E2FDCD586258D56FA9FEBB78BDDB1EB9BE6700672D7F2DD5436FD0
      7A56E7315DC8086CD960844E6ED2158069F6DD5A00CB7203867B076C4685B01E
      6AEC900140B6D19D66DE7969F1DCF7B9D90B923D23E8F9F1DB86EBF071604A3A
      773003EB66AAF57C7E916303F8F96BA91E6AA25E2B12B27D3C23B1E9DCFB1956
      D00586D0B91857CEBA34EB80C0E701568DDE0CABA842F5AD851E3D084FE92C23
      D5554D00A2E432A0F05E4F063D3FFED1361EAB9A66678BE7EB8354F5507E9963
      0298F4F35779EF1450435BD242BB8D0142E775A7EDCE0130B320E50219176769
      06861FA0D012C38A515F533666E193AC90D426480A098F3519919F8FFDD69C72
      D3EF9351BF3AECC6C3877F8A9826A5F38A0C08FBA9FAD11CF1F6476E38068027
      5FE5472BA8997B3245771BD93B05B88CED94607ECCCC1B3ACC1F2684CE08920F
      6C93EB09EE362C1EF61D892700A2D50021EA64E22D1F930B3418E279FE9F0A7A
      C17802F71D5A88FA447E77E279407D972A375E5A3A0E007FE58727D399AD3DA5
      B04707207463F66296057477E90E08971637E1A6414D060048D62408BE4DC90E
      DAB64248F8D2418F0F7D2B6AAFC517C13199823B6594F4EF56AA78F50900401E
      9DFA864C7A60B699A7AD206358CB1EE3856E2040C81801CC4B777601967683DB
      87D6616A71D8146E355DC104C17F88E5DB0AB5F93303C05BCD13F0A7A619A968
      DFD1FB49F1CD54DF02AAF60D8E2158BD1B075E7CFCB82C80FF1F444D7C851A3C
      35EDCB1941AEC312324477E3F399513F2D3E9D0465B8801908F9F2E8E843A8C8
      6719E2B34158A107F7E2EB5DFFC4D2EAEB8D1F6A6401D048F88BB4F5301D6E85
      996354BDF22CFC7BB7F60C60E6BD4FC352425995792ACEC49B039AF818356744
      4750EB668C370064F53E32FC3E35F409E89204211303FDDFBD623EA69F3D1C4B
      EE988521830764B982158A60C187D509BCBCBD9DFC5FCB14AECBD0DF2EB2688F
      DA05B6471618AC54722486D077BBF1CEEAFF444B4BCBD101CC9A35CB2871221A
      5481882620AC0B425813449F225EDDA8483FF16BD27412286602E812FCB24D3F
      63E84B41C874829470BE288156EC5DB9088944C278F2F4BB5FFC143F983EC510
      1ED62CF87BB58AB7F745D11A5133D3E7707F8BF25A7FABB63257D2764B029853
      D4995362CCCE7F6E64DE7684C3613CF2C8239D207402C04F56545418C7A95E3B
      B529873EE0A02FF3493C3EB393E35384F2CAA8E5F29A84E5FC56552AE3762F1C
      C5EF53BD9F14DD79FCEFD60568891EDA83DA577F6900E0859FFBE30B4FE170CE
      70BCFFAD8270424F0D97AC50560E0FB325360CB72B6F92D83618334AE0B77A31
      5E157D2C4297E3D340FC878AC60380E5CB9763EFDEBDC704E0A53286CA582AA5
      540AA8F0295D371517150B8711D5046F9D2217D5276467936AB1B669B2C40463
      E9C8F6B220A47BBEEB20606088ECFC04BEF5AF25C5BB0BE099743172C75FC87F
      7D01BBA0E9A5B2A20CB024C283AC4A0B89E6C2F8D3C630371E733B6042E02F12
      3650A9A4F20D15FEC2967E3C000453F44554BE476508957C53788E295E32D7FC
      715B6AD647D018449F2A490442F0EB12829494847449083359A058C21F9FA5CC
      20ABFF3B284437BF0DD67C90E58DBF80150F1B835C596379928A2259651EC978
      4148CBF80A33F7B978D5DC4EF5387F3E7684CA9754FE4E85AB568ED7029CA670
      9E3E969816C0AD22D774056B0610D1ACC7667E4F06BA8F72095DA0A02A082A81
      D059E75C5822A7B35011E86626C76EEBEE773429B151B3E8E6312E3E681E4B59
      40C004D04CE510952A2AADC7B480C58B1763F2E4C9A95DD9146A35C5F1E2308F
      CBA658BB5987689E4BB9C7E99A76E700B87987CD6D983D1F36C57318B18CED78
      C6B601B54700656565B8FBEEBB515454D4DDC5858CCFA7B6C58C7DBE2D651C3B
      1D4BCA0AB2DD80173D6BBFCBB26DDB36AC5CB9B2D3B1FF0376F780D737186D02
      0000000049454E44AE426082}
  end
  object STGridPessoa: TStringGrid
    Left = 0
    Top = 301
    Width = 833
    Height = 82
  object LabelClientes: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Alunos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object STGridPessoa: TStringGrid
    Left = 8
    Top = 264
    Width = 833
    Height = 174
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
    Visible = False
  end
  object BitBtnExportarAlunosXLS: TBitBtn
    Left = 8
    Top = 264
  end
  object BitBtnExportarAlunosXLS: TBitBtn
    Left = 8
    Top = 233
    Width = 120
    Height = 25
    Caption = 'Exportar para XLS'
    TabOrder = 1
    OnClick = BitBtnExportarAlunosXLSClick
  end
  object BitBtnExportarAlunosHTML: TBitBtn
    Left = 134
    Top = 264
    Top = 233
    Width = 120
    Height = 25
    Caption = 'Exportar para HTML'
    TabOrder = 2
    OnClick = BitBtnExportarAlunosHTMLClick
  end
  object DBGridClientes: TDBGrid
    Left = 8
    Top = 27
    Width = 832
    Height = 190
    DataSource = DataSourceClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sobrenome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Matricula'
        Visible = True
      end>
  end
  object StaticText1: TStaticText
    Left = 360
    Top = 192
    Width = 59
    Height = 17
    Caption = 'StaticText1'
    TabOrder = 4
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 391
    Width = 853
    Height = 32
    Panels = <
      item
        Width = 50
      end>
    ExplicitTop = 389
  end
  object ClientDataSetClientes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Sobrenome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Matricula'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    IndexFieldNames = 'Id'
    Params = <>
    StoreDefs = True
    Left = 92
    Top = 166
    object ClientDataSetClientesId: TIntegerField
      FieldName = 'Id'
    end
    object ClientDataSetClientesNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object ClientDataSetClientesSobrenome: TStringField
      FieldName = 'Sobrenome'
      Size = 50
    end
    object ClientDataSetClientesMatricula: TStringField
      FieldName = 'Matricula'
    end
  end
  object DataSourceClientes: TDataSource
    DataSet = ClientDataSetClientes
    Left = 204
    Top = 166
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 528
    Top = 392
  end
end

object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 504
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object STGridPessoa: TStringGrid
    Left = 0
    Top = 422
    Width = 906
    Height = 82
    Align = alBottom
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
    Visible = False
  end
  object DBGridClientes: TDBGrid
    Left = 0
    Top = 79
    Width = 906
    Height = 309
    Align = alClient
    DataSource = DataSourceClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sobrenome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Matricula'
        Visible = True
      end>
  end
  object pnConsulta: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 900
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 21
      Width = 96
      Height = 13
      Caption = 'Campos p/ pesquisa'
    end
    object Label2: TLabel
      Left = 159
      Top = 21
      Width = 73
      Height = 13
      Caption = 'Texto Pesquisa'
    end
    object Label3: TLabel
      Left = 375
      Top = 21
      Width = 96
      Height = 13
      Caption = 'Op'#231#245'es de pesquisa'
    end
    object cbCampo: TComboBox
      Left = 8
      Top = 39
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'id'
        ''
        'nome')
    end
    object editTextoPesquisa: TEdit
      Left = 159
      Top = 39
      Width = 210
      Height = 21
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 375
      Top = 39
      Width = 145
      Height = 21
      TabOrder = 2
    end
    object btnPesquisar: TButton
      Left = 526
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 3
    end
  end
  object pnAcoes: TPanel
    Left = 0
    Top = 388
    Width = 906
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object BitBtnExportarAlunosXLS: TBitBtn
      Left = 77
      Top = 4
      Width = 120
      Height = 25
      Caption = 'Exportar para XLS'
      TabOrder = 0
      OnClick = BitBtnExportarAlunosXLSClick
    end
    object BitBtnExportarAlunosHTML: TBitBtn
      Left = 197
      Top = 3
      Width = 120
      Height = 25
      Caption = 'Exportar para HTML'
      TabOrder = 1
      OnClick = BitBtnExportarAlunosHTMLClick
    end
    object btnEditar: TButton
      Left = 2
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
    end
  end
  object ClientDataSetClientes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Sobrenome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Matricula'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    IndexFieldNames = 'Id'
    Params = <>
    StoreDefs = True
    Left = 92
    Top = 166
    object ClientDataSetClientesId: TIntegerField
      FieldName = 'Id'
    end
    object ClientDataSetClientesNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object ClientDataSetClientesSobrenome: TStringField
      FieldName = 'Sobrenome'
      Size = 50
    end
    object ClientDataSetClientesMatricula: TStringField
      FieldName = 'Matricula'
    end
  end
  object DataSourceClientes: TDataSource
    DataSet = ClientDataSetClientes
    Left = 204
    Top = 166
  end
end
=======
object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 504
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object STGridPessoa: TStringGrid
    Left = 0
    Top = 422
    Width = 906
    Height = 82
    Align = alBottom
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
    Visible = False
  end
  object DBGridClientes: TDBGrid
    Left = 0
    Top = 79
    Width = 906
    Height = 309
    Align = alClient
    DataSource = DataSourceClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sobrenome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Matricula'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 368
    Top = 233
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button1Click
  end
  object ClientDataSetClientes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Sobrenome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Matricula'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    IndexFieldNames = 'Id'
    Params = <>
    StoreDefs = True
    Left = 92
    Top = 166
    object ClientDataSetClientesId: TIntegerField
      FieldName = 'Id'
    end
    object ClientDataSetClientesNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object ClientDataSetClientesSobrenome: TStringField
      FieldName = 'Sobrenome'
      Size = 50
    end
    object ClientDataSetClientesMatricula: TStringField
      FieldName = 'Matricula'
    end
  end
  object DataSourceClientes: TDataSource
    DataSet = ClientDataSetClientes
    Left = 204
    Top = 166
  end
  object ApplicationEvents: TApplicationEvents
    OnException = ApplicationEventsException
    Left = 396
    Top = 128
  end
end
>>>>>>> ea44d3cd38f0593779d498c216d0e07ea972eb24
