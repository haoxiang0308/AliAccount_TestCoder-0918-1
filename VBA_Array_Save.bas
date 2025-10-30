Sub SaveArrayToFile()
    Dim dados As Variant
    Dim i As Long, j As Long
    Dim conteudo As String
    Dim nomeArquivo As String
    Dim caminho As String
    
    ' Supondo que os dados estejam na Plan1, colunas A a C, linhas 1 a 10
    ReDim dados(1 To 10, 1 To 3) ' Ajuste o tamanho conforme necessário
    
    ' Carregar dados da planilha para o array
    For i = 1 To 10
        For j = 1 To 3
            dados(i, j) = Cells(i, j).Value
        Next j
    Next i
    
    ' Criar conteúdo do arquivo a partir do array
    For i = 1 To 10
        For j = 1 To 3
            conteudo = conteudo & dados(i, j)
            If j < 3 Then conteudo = conteudo & vbTab ' Separador de coluna
        Next j
        conteudo = conteudo & vbCrLf ' Separador de linha
    Next i
    
    ' Gerar nome aleatório para o arquivo
    Randomize
    nomeArquivo = "Dados_" & Format(Now, "yyyymmdd_hhmmss") & "_" & Int(Rnd() * 10000) & ".txt"
    caminho = ThisWorkbook.Path & "\" & nomeArquivo ' Salvar no mesmo diretório do workbook
    
    ' Salvar conteúdo no arquivo
    Open caminho For Output As #1
    Print #1, conteudo
    Close #1
    
    MsgBox "Dados salvos com sucesso em: " & nomeArquivo
End Sub

Sub LoadDataToArray()
    Dim dados As Variant
    Dim ultimaLinha As Long, ultimaColuna As Long
    Dim i As Long, j As Long
    
    ' Encontrar a última linha e coluna com dados
    ultimaLinha = Cells(Rows.Count, 1).End(xlUp).Row
    ultimaColuna = Cells(1, Columns.Count).End(xlToLeft).Column
    
    ' Redimensionar o array para acomodar os dados
    ReDim dados(1 To ultimaLinha, 1 To ultimaColuna)
    
    ' Carregar dados da planilha para o array
    For i = 1 To ultimaLinha
        For j = 1 To ultimaColuna
            dados(i, j) = Cells(i, j).Value
        Next j
    Next i
    
    ' Agora o array 'dados' contém todos os dados da planilha
    ' Pode-se manipular os dados conforme necessário
    ' Por exemplo, salvá-los em um arquivo com nome aleatório
    Call SaveArrayToFileFromData(dados, ultimaLinha, ultimaColuna)
End Sub

Sub SaveArrayToFileFromData(ByRef dados As Variant, ByVal ultimaLinha As Long, ByVal ultimaColuna As Long)
    Dim i As Long, j As Long
    Dim conteudo As String
    Dim nomeArquivo As String
    Dim caminho As String
    
    ' Criar conteúdo do arquivo a partir do array
    For i = 1 To ultimaLinha
        For j = 1 To ultimaColuna
            conteudo = conteudo & dados(i, j)
            If j < ultimaColuna Then conteudo = conteudo & vbTab ' Separador de coluna
        Next j
        conteudo = conteudo & vbCrLf ' Separador de linha
    Next i
    
    ' Gerar nome aleatório para o arquivo
    Randomize
    nomeArquivo = "Dados_" & Format(Now, "yyyymmdd_hhmmss") & "_" & Int(Rnd() * 10000) & ".txt"
    caminho = ThisWorkbook.Path & "\" & nomeArquivo ' Salvar no mesmo diretório do workbook
    
    ' Salvar conteúdo no arquivo
    Open caminho For Output As #1
    Print #1, conteudo
    Close #1
    
    MsgBox "Dados salvos com sucesso em: " & nomeArquivo
End Sub