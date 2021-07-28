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
}

function Main {
    ListandoOsItensDaPastaScripts
}

Main