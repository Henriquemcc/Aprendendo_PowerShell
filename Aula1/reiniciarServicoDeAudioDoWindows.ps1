Write-Output "Obtendo o serviço de audio do Windows ""AudioSrv""..."
$servico = Get-Service -Name "AudioSrv"

Write-Output "Parando o serviço ""AudioSrv""..."
$servico.Stop()

Write-Output "Iniciando o serviço ""AudioSrv""..."
$servico.Start()