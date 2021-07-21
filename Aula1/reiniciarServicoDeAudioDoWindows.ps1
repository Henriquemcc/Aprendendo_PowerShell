Write-Host "Obtendo o serviço de audio do Windows ""AudioSrv""..."
$servico = Get-Service -Name "AudioSrv"

Write-Host "Parando o serviço ""AudioSrv""..."
$servico.Stop()

Write-Host "Iniciando o serviço ""AudioSrv""..."
$servico.Start()