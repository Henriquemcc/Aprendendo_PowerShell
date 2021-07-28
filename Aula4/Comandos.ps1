function ListandoOsItensDaPastaScripts {

    Write-Host "Listando os itens da pasta scripts"
    Write-Host

    $pastaScripts = "C:\Scripts"

    Write-Host "Mostrando os itens:"
    Get-ChildItem -Path $pastaScripts
    Write-Host

    Write-Host "Mostrando os itens recursivamente:"
    Get-ChildItem -Path $pastaScripts -Recurse
    Write-Host

    Write-Host "Mostrando os arquivos recursivamente:"
    Get-ChildItem -Path $pastaScripts -Recurse -File
    Write-Host

    Write-Host "Mostrando o campo 'Name' dos arquivos recursivamente"
    Get-ChildItem -Path $pastaScripts -Recurse -File | Select-Object -Property Name
    Write-Host

    Write-Host "Mostrando o campo 'Name' dos arquivos recursivemente que sejam parecidos com '*_migrando_*'"
    Get-ChildItem -Path $pastaScripts -Recurse -File | Select-Object -Property Name | Where-Object {
        $_ -like "*_migrando_*"
    }

    Write-Host "Mostrando os campos 'Name' e 'Length' dos arquivos recursivemente que sejam parecidos com '*_migrando_*'"
    Get-ChildItem -Path $pastaScripts -Recurse -File | Select-Object -Property Name | Where-Object {
        $_ -like "*_migrando_*"
    } | Select-Object -Property Length   
    Write-Host "Não foi possível mostrar o campo 'Length' pois ele foi filtrado e descartado pelo 'Select-Object -Property Name'."
    Write-Host

    Write-Host "Mostrando os campos 'Name' e 'Length' dos arquivos recursivemente que sejam parecidos com '*_migrando_*'"
    Get-ChildItem -Path $pastaScripts -Recurse -File | Where-Object -Property Name -Like "*_migrando_*" | Select-Object -Property Name, Length
    Write-Host

    Write-Host "Mostrando os campos 'Name' e 'Length' dos arquivos recursivemente que sejam parecidos com '*_migrando_*' (outra forma)"
    $arquivosRecursivosDaPasta = Get-ChildItem -Path $pastaScripts -Recurse -File
    foreach ($arquivo in $arquivosRecursivosDaPasta) {
        if ($arquivo.Name -like "*_migrando_*") {
            Write-Host "$($arquivo.Name) $($arquivo.Length)"
        }
    }
    Write-Host

    Write-Host "Mostrando os campos 'Name' e 'Length' dos arquivos recursivemente que sejam parecidos com '*_migrando_*' (outra forma)"
    $arquivosRecursivosDaPasta = Get-ChildItem -Path $pastaScripts -Recurse -File
    foreach ($arquivo in $arquivosRecursivosDaPasta) {
        if ($arquivo.Name -like "*_migrando_*") {
            Select-Object -InputObject $arquivo -Property Name, Length
        }
    }
    Write-Host

    Write-Host "----------------------------------------------------------------------------------------------------------------------"
}

function ConvertendoBytesEFormatandoNumeros {
    Write-Host "Convertendo Bytes e formatando números"
    Write-Host

    Write-Host "Dividindo números:"
    1376 / 1024
    Write-Host
    
    Write-Host "Utilizando especificadores de bytes:"
    123kb
    Write-Host

    Write-Host "Dividindo números por especificadores de bytes:"
    5445644654 / 1GB
    Write-Host

    Write-Host "Obtendo o tipo do resultado da divisão:"
    (5445644654 / 1GB).GetType().Name
    Write-Host

    Write-Host "Convertendo o tipo double para uma string com formatação:"
    (5445644654 / 1GB).ToString("N2")
    Write-Host "O N significa numeric (númerico). O 2 após o N é o número de casas decimais após a vírgula. Mais informações: https://docs.microsoft.com/en-us/dotnet/standard/base-types/standard-numeric-format-strings#the-numeric-n-format-specifier"
    Write-Host

    Write-Host "Adicionando a unidade de medida no final da string:"
    (5445644654 / 1GB).ToString("N2") + "GB"
    Write-Host

    Write-Host "Utilizando o operador de formatação:"
    "{0:N2}" -f (5445644654 / 1GB)
    Write-Host

    Write-Host "Adicionando a unidade de medida no final da string com o operador de formatação:"
    "{0:N2}GB" -f (5445644654 / 1GB)
    Write-Host
    
    Write-Host "----------------------------------------------------------------------------------------------------------------------"
}

function Main {
    ListandoOsItensDaPastaScripts
    ConvertendoBytesEFormatandoNumeros
}

Main