Write-Host "CommandPrecedence:"

# Saindo do diretório atual se ele começa com a string 'Aula'
if ((Split-Path -Path((Get-Location).Path) -Leaf).StartsWith(("Aula"))) {
    Set-Location -Path ".."
}
# Entrando na pasta 'Aula1'
Set-Location -Path "./Aula1"

Write-Host "Tentando executar o scrpt batch da aula passada sem o ""CommandPrecedence""..."
try {
    reiniciarServicoByteBankSrv01.bat
}
catch {
    Write-Error $_
}

Write-Host "Tentando executar o script bash da aula passada com o ""CommandPrecedence""..."
try {
    ./reiniciarServicoByteBankSrv01.bat
}
catch {
    Write-Error $_
}