# Alterando a variável $ErrorActionPreference para que 
$ErrorActionPreference = "Stop"

# Criando a variável $pastaScripts
$pastaScripts = "C:\Scripts\"

# Criando uma Hash Table para a coluna nome
$nameExpression = @{
    Label = "Nome"
    Expression = { $_.Name }
}

# Criando uma Hash Table para a coluna tamanho
$lengthExpression = @{
    Label = "Tamanho"
    Expression = { "{0:N2}KB" -f ($_.Length / 1KB) }
}

# Criando um array com as Hash Tables
$parameters = $nameExpression, $lengthExpression

# Exibindo os arquivos
$resultado = Get-ChildItem -Path $pastaScripts -Recurse -File |
        Where-Object -Property Name -Like "*_migrando_*" |
        Select-Object -Property $parameters

# Lendo o arquivo styles.css
$estilos = Get-Content ..\styles.css

# Criando a tag style
$styleTag = "<style> $estilos </style>"

# Criando o título da página
$tituloPagina = "Relatorio de Scripts em Migracao"

# Criando o título em HTML para ser colocado na tag body
$tituloBody = "<h1> $tituloPagina </h1>"

# Convertendo para HTML
$resultado |
        ConvertTo-Html -Head $styleTag -Title $tituloPagina -Body $tituloBody |
        Out-File .\Relatorio.html