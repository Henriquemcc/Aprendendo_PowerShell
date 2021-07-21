Write-Host "Obtendo o serviço ""ByteBank Interface Service"" do servidor ""SRV01"""
$servico = Get-Service -Name "ByteBank Interface Service" -ComputerName "SRV01"

Write-Host "Verificando se o serviço ""ByteBank Interface Service"" está sendo executado"
if ($servico.Status -eq "Running") {

    Write-Host "Parando o serviço ""ByteBank Interface Service""..."
    $servico.Stop()

    Write-Host "Iniciando o servico ""ByteBank Interface Service""..."
    $servico.Start()
}

else {
    Write-Host "O serviço ""ByteBank Interface Service"" não esta sendo executado no servidor"
}