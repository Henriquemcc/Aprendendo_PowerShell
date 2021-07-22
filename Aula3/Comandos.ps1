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

function Main {
    MostrarValorVariavelDeAmbienteProfile
    TestarCriacaoArquivoProfileCurrentUserCurrentHost
}

Main