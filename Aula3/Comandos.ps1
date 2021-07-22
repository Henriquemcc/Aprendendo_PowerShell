function MostrarValorVariavelDeAmbienteProfile {

    Write-Host "Mostrando o valor da variável de ambiente profile"
    Write-Host ""

    Write-Host $profile
    Write-Host ""

    Write-Host "----------------------------------------------------------------------------------------------------------------------"
}

function TestarCriacaoArquivoProfileCurrentUserCurrentHost {
    Write-Host "Testando a criação do arquivo profile do PowerShell CurrentUserCurrentHost"
    Write-Host ""

    Write-Host "Verificando se o arquivo profile de CurrentUserCurrentHost existe"

    if ([System.IO.File]::Exists($profile.CurrentUserCurrentHost)) {
        Write-Host "O arquivo $($profile.CurrentUserCurrentHost) já existe"
    }
    else {

        $criarArquivo = ""
        do {
            Write-Host "O arquivo $($profile.CurrentUserCurrentHost) não existe"
            $criarArquivo = (Read-Host -Prompt "Gostaria de cria-lo? (s/n) ").ToLower()[0]
        }
        while ($criarArquivo -ne 's' -and $criarArquivo -ne 'n')

        if ($criarArquivo -eq 's') {
            Write-Host "Criando o arquivo $($profile.CurrentUserCurrentHost)..."
            New-Item -Path $profile.CurrentUserCurrentHost
            Write-Host "Editando o arquivo com o NotePad..."
            notepad.exe $profile.CurrentUserCurrentHost
        }
    }
    Write-Host ""
    Write-Host "----------------------------------------------------------------------------------------------------------------------"
}

function MostrarPoliticaDeExecucao {
    Write-Host "Mostrando a política de execução"
    Write-Host ""

    Write-Host "Política de Execução atual:"
    Get-ExecutionPolicy
    Write-Host ""

    Write-Host "----------------------------------------------------------------------------------------------------------------------"
}

function AlterarPoliticaDeExecucao {
    Write-Host "Alterando a política de execução"
    Write-Host ""

    try {
        Start-Process -FilePath "powershell" -ArgumentList "Set-ExecutionPolicy Unrestricted" -Verb RunAs
    }
    catch {
        Write-Error $_
    }
    Write-Host ""

    Write-Host "----------------------------------------------------------------------------------------------------------------------"
}

function TestarCriacaoArquivoProfileAllUsersAllHosts {
    Write-Host "Testando a criação do arquivo profile do PowerShell AllUsersAllHosts"
    Write-Host ""

    Write-Host "Verificando se o arquivo profile de AllUsersAllHosts existe"

    if ([System.IO.File]::Exists($profile.AllUsersAllHosts)) {
        Write-Host "O arquivo $($profile.AllUsersAllHosts) já existe"
    }
    else {

        $criarArquivo = ""
        do {
            Write-Host "O arquivo $($profile.AllUsersAllHosts) não existe"
            $criarArquivo = (Read-Host -Prompt "Gostaria de cria-lo? (s/n) ").ToLower()[0]
        }
        while ($criarArquivo -ne 's' -and $criarArquivo -ne 'n')

        if ($criarArquivo -eq 's') {
            Write-Host "Criando o arquivo $($profile.AllUsersAllHosts)..."
            Start-Process -FilePath "powershell" -ArgumentList "New-Item -Path $($profile.AllUsersAllHosts)" -Verb RunAs
            Write-Host "Editando o arquivo com o NotePad..."
            Start-Process -FilePath "notepad.exe" -ArgumentList $profile.AllUsersAllHosts -Verb RunAs
        }
    }
    Write-Host ""
    Write-Host "----------------------------------------------------------------------------------------------------------------------"
}

function Main {
    MostrarValorVariavelDeAmbienteProfile
    TestarCriacaoArquivoProfileCurrentUserCurrentHost
    MostrarPoliticaDeExecucao
    AlterarPoliticaDeExecucao
    TestarCriacaoArquivoProfileAllUsersAllHosts
}

Main