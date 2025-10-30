Sub ArmazenarDadosEmArrayESalvar()
    ' Declaração de variáveis
    Dim dadosArray() As Variant
    Dim ultimaLinha As Long
    Dim ultimaColuna As Long
    Dim i As Long, j As Long
    Dim caminhoArquivo As String
    Dim nomeArquivo As String
    
    ' Obter a planilha ativa
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Encontrar a última linha e coluna com dados
    ultimaLinha = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    ultimaColuna = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Redimensionar o array para armazenar os dados
    ReDim dadosArray(1 To ultimaLinha, 1 To ultimaColuna)
    
    ' Preencher o array com os dados da planilha
    For i = 1 To ultimaLinha
        For j = 1 To ultimaColuna
            dadosArray(i, j) = ws.Cells(i, j).Value
        Next j
    Next i
    
    ' Gerar nome aleatório para o arquivo
    Randomize
    nomeArquivo = "Dados_" & Format(Now, "ddmmyyyy_hhmmss") & "_" & Int(Rnd() * 10000) & ".txt"
    caminhoArquivo = ThisWorkbook.Path & "\" & nomeArquivo
    
    ' Salvar os dados do array em um arquivo de texto
    Dim fileNum As Integer
    fileNum = FreeFile
    
    Open caminhoArquivo For Output As #fileNum
    For i = 1 To UBound(dadosArray, 1)
        Dim linhaTexto As String
        linhaTexto = ""
        For j = 1 To UBound(dadosArray, 2)
            If j = 1 Then
                linhaTexto = dadosArray(i, j)
            Else
                linhaTexto = linhaTexto & vbTab & dadosArray(i, j)
            End If
        Next j
        Print #fileNum, linhaTexto
    Next i
    Close #fileNum
    
    ' Mostrar mensagem de confirmação
    MsgBox "Dados armazenados no array e salvos com sucesso no arquivo: " & nomeArquivo
End Sub

Sub ExemploPreenchimentoDados()
    ' Esta sub preenche a planilha com dados de exemplo para testar a função principal
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Limpar dados antigos
    ws.Cells.Clear
    
    ' Preencher com dados de exemplo
    ws.Cells(1, 1).Value = "Nome"
    ws.Cells(1, 2).Value = "Idade"
    ws.Cells(1, 3).Value = "Cidade"
    
    ws.Cells(2, 1).Value = "João"
    ws.Cells(2, 2).Value = 25
    ws.Cells(2, 3).Value = "São Paulo"
    
    ws.Cells(3, 1).Value = "Maria"
    ws.Cells(3, 2).Value = 30
    ws.Cells(3, 3).Value = "Rio de Janeiro"
    
    ws.Cells(4, 1).Value = "Pedro"
    ws.Cells(4, 2).Value = 22
    ws.Cells(4, 3).Value = "Belo Horizonte"
    
    MsgBox "Dados de exemplo preenchidos na planilha."
End Sub