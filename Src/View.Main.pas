unit View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.IOUtils,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCCustomWEBComponent,
  VCL.TMSFNCWXDocX,
  VCL.TMSFNCWXDocx.Models,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCBitmapContainer;

type
  TViewMain = class(TForm)
    TMSFNCWXDocx1: TTMSFNCWXDocx;
    btnGenerateDocxTest: TButton;
    btnGenerateDocxTest2: TButton;
    procedure btnGenerateDocxTestClick(Sender: TObject);
    procedure TMSFNCWXDocx1DownloadAsFile(Sender: TObject; FileName: string);
    procedure btnGenerateDocxTest2Click(Sender: TObject);
  private

  public

  end;

var
  ViewMain: TViewMain;

implementation

{$R *.dfm}

procedure TViewMain.btnGenerateDocxTestClick(Sender: TObject);
var
  LSection: TTMSFNCWXDocxSection;
  LParagraph:  TTMSFNCWXDocxParagraph;
  LText: TTMSFNCWXDocxText;
begin
  TMSFNCWXDocx1.Document.Sections.Clear;
  LSection := TMSFNCWXDocx1.Document.AddSection;
  LParagraph := LSection.AddParagraph;
  LText := LParagraph.AddText('World com Delphi');
  LText.Font.Color := clRed;

  TMSFNCWXDocx1.GetDocxAsFile('Doc-Teste.docx');
end;

procedure TViewMain.TMSFNCWXDocx1DownloadAsFile(Sender: TObject; FileName: string);
begin
  TTMSFNCUtils.OpenFile(FileName);
end;

procedure TViewMain.btnGenerateDocxTest2Click(Sender: TObject);
const
  C_IMAGE_PATH = '..\Images\C4D-128X128.png';

  procedure AddTableCell(ARow: TTMSFNCWXDocxTableRow; const AValue: string; AHeader: Boolean);
  begin
    var LCell := ARow.AddCell;
    LCell.Borders.Borders := [boLeft, boTop, boBottom, boRight];
    LCell.Borders.Left.Value := bsSingle;
    LCell.Borders.Top.Value := bsSingle;
    LCell.Borders.Bottom.Value := bsSingle;
    LCell.Borders.Right.Value := bsSingle;
    LCell.Borders.Left.Color := 'B7C9E2';
    LCell.Borders.Top.Color := 'B7C9E2';
    LCell.Borders.Bottom.Color := 'B7C9E2';
    LCell.Borders.Right.Color := 'B7C9E2';
    LCell.Borders.Left.Size := 4;
    LCell.Borders.Top.Size := 4;
    LCell.Borders.Bottom.Size := 4;
    LCell.Borders.Right.Size := 4;

    if AHeader then
    begin
      LCell.Shading.ShadingType := stClear;
      LCell.Shading.Fill := 'D9EAF7';
    end;

    var LParagraph := LCell.AddParagraph;
    var LText := LParagraph.AddText(AValue);
    if AHeader then
    begin
      LParagraph.Alignment := taCenter;
      LText.Font.Style := [TFontStyle.fsBold];
      LText.Font.Color := clNavy;
    end;
  end;
begin
  TMSFNCWXDocx1.Document.Sections.Clear;
  var LSection := TMSFNCWXDocx1.Document.AddSection;

  var LParagraph := LSection.AddParagraph;
  LParagraph.Heading := hlTitle;
  LParagraph.Alignment := taCenter;
  var LText := LParagraph.AddText('Exemplo completo de DOCX com Delphi');
  LText.Font.Name := 'Segoe UI';
  LText.Font.Size := 22;
  LText.Font.Style := [TFontStyle.fsBold];
  LText.Font.Color := clNavy;

  LParagraph := LSection.AddParagraph;
  LParagraph.Alignment := taJustified;
  LParagraph.Spacing.After := 200;
  LText := LParagraph.AddText('Este paragrafo combina ');
  LText.Font.Size := 12;
  LText := LParagraph.AddText('negrito');
  LText.Font.Size := 12;
  LText.Font.Style := [TFontStyle.fsBold];
  LText := LParagraph.AddText(', ');
  LText.Font.Size := 12;
  LText := LParagraph.AddText('italico');
  LText.Font.Size := 12;
  LText.Font.Style := [TFontStyle.fsItalic];
  LText := LParagraph.AddText(', texto colorido');
  LText.Font.Size := 12;
  LText.Font.Color := clRed;
  LText := LParagraph.AddText(' e texto destacado.');
  LText.Font.Size := 12;
  LText.Highlight := 'yellow';

  LParagraph := LSection.AddParagraph;
  LParagraph.AddText('Conheca mais em: ');
  var LExternalHyperlink := LParagraph.AddExternalHyperlink;
  LExternalHyperlink.Link := 'https://code4delphi.com.br';
  LText := LExternalHyperlink.AddText('Code4Delphi');
  LText.Font.Color := clBlue;
  LText.Font.Style := [TFontStyle.fsUnderline];

  LParagraph := LSection.AddParagraph;
  LParagraph.Heading := hlHeading1;
  LParagraph.AddText('Tabela de recursos');

  var LTable := LSection.AddTable;
  LTable.Width.WidthType := wtPercentage;
  LTable.Width.Size := 100;

  var LRow := LTable.AddRow;
  LRow.TableHeader := True;
  AddTableCell(LRow, 'Recurso', True);
  AddTableCell(LRow, 'Exemplo', True);
  AddTableCell(LRow, 'Status', True);

  LRow := LTable.AddRow;
  AddTableCell(LRow, 'Formatacao', False);
  AddTableCell(LRow, 'Negrito, italico, cores e destaque', False);
  AddTableCell(LRow, 'Incluido', False);

  LRow := LTable.AddRow;
  AddTableCell(LRow, 'Link', False);
  AddTableCell(LRow, 'Hyperlink externo clicavel', False);
  AddTableCell(LRow, 'Incluido', False);

  LRow := LTable.AddRow;
  AddTableCell(LRow, 'Imagem', False);
  AddTableCell(LRow, 'Logotipo carregado de arquivo PNG', False);
  AddTableCell(LRow, 'Incluido quando localizado', False);

  LParagraph := LSection.AddParagraph;
  LParagraph.Heading := hlHeading1;
  LParagraph.AddText('Imagem');

  if TFile.Exists(C_IMAGE_PATH) then
  begin
    var LBitmap := TTMSFNCBitmap.Create;
    try
      LBitmap.LoadFromFile(C_IMAGE_PATH);
      LParagraph := LSection.AddParagraph;
      LParagraph.Alignment := taCenter;
      LParagraph.AddImage(LBitmap, 128, 128);
    finally
      LBitmap.Free;
    end;
  end
  else
  begin
    LParagraph := LSection.AddParagraph;
    LText := LParagraph.AddText('Imagem nao localizada: ' + C_IMAGE_PATH);
    LText.Font.Color := clRed;
    LText.Font.Style := [TFontStyle.fsItalic];
  end;

  TMSFNCWXDocx1.GetDocxAsFile('Doc-Teste-Completo.docx');
end;

end.
