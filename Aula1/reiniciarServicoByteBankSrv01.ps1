Write-Output "Obtendo o serviço ""ByteBank Interface Service"" do servidor ""SRV01"""
$servico = Get-Service -Name "ByteBank Interface Service" -ComputerName "SRV01"

Write-Output "Verificando se o serviço ""ByteBank Interface Service"" está sendo executado"
if ($servico.Status -eq "Running") {

    Write-Output "Parando o serviço ""ByteBank Interface Service""..."
    $servico.Stop()

    Write-Output "Iniciando o servico ""ByteBank Interface Service""..."
    $servico.Start()
}

else {
    Write-Output "O serviço ""ByteBank Interface Service"" não esta sendo executado no servidor"
}