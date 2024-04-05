Describe "azcopy" {
    It "azcopy" {
        "azcopy --version" | Should -ReturnZeroExitCode
    }

    It "azcopy10 link exists" {
        "azcopy10 --version" | Should -ReturnZeroExitCode
    }
}

Describe "Bicep" {
    It "Bicep" {
        "bicep --version" | Should -ReturnZeroExitCode
    }
}

Describe "Git" {
    It "git" {
        "git --version" | Should -ReturnZeroExitCode
    }

    It "git-ftp" {
        "git-ftp --version" | Should -ReturnZeroExitCode
    }
}
Describe 'Ansible' {
    It 'Ansible' {
        'ansible --version' | Should -ReturnZeroExitCode
    }
}
Describe 'Mono' {
    It 'mono' {
        'mono --version' | Should -ReturnZeroExitCode
    }

    It 'msbuild' {
        'msbuild -version' | Should -ReturnZeroExitCode
    }

    It 'nuget' {
        'nuget' | Should -ReturnZeroExitCode
    }
}
Describe 'SqlPackage' {
    It 'sqlpackage' {
        'sqlpackage /version' | Should -ReturnZeroExitCode
    }
}

Describe 'Python' {
    $testCases = @('python', 'pip', 'python3', 'pip3') | ForEach-Object { @{PythonCommand = $_ } }

    It '<PythonCommand>' -TestCases $testCases {
        "$PythonCommand --version" | Should -ReturnZeroExitCode
    }
}

Describe 'nvm' {
    It 'nvm' {
        'source /etc/skel/.nvm/nvm.sh && nvm --version' | Should -ReturnZeroExitCode
    }
}
Describe 'MSSQLCommandLineTools' {
    It 'sqlcmd' {
        'sqlcmd -?' | Should -ReturnZeroExitCode
    }
}
Describe "Git-lfs" {
    It "git-lfs" {
        "git-lfs --version" | Should -ReturnZeroExitCode
    }
}


Describe "Kubernetes tools" {
    It "kind" {
        "kind version" | Should -ReturnZeroExitCode
    }

    It "kubectl" {
        "kubectl version --client=true" | Should -OutputTextMatchingRegex "Client Version: v"
    }

    It "helm" {
        "helm version --short" | Should -ReturnZeroExitCode
    }

    It "kustomize" {
        "kustomize version" | Should -ReturnZeroExitCode
    }
}

Describe 'Docker' {
    It 'docker client' {
        $version = (Get-ToolsetContent).docker.components | Where-Object { $_.package -eq 'docker-ce-cli' } | Select-Object -ExpandProperty version
        If ($version -ne 'latest') {
            $(docker version --format '{{.Client.Version}}') | Should -BeLike "*$version*"
        } else {
            "docker version --format '{{.Client.Version}}'" | Should -ReturnZeroExitCode
        }
    }

    It 'docker buildx' {
        $version = (Get-ToolsetContent).docker.plugins | Where-Object { $_.plugin -eq 'buildx' } | Select-Object -ExpandProperty version
        If ($version -ne 'latest') {
            $(docker buildx version) | Should -BeLike "*$version*"
        } else {
            'docker buildx' | Should -ReturnZeroExitCode
        }
    }

    It 'docker compose v2' {
        $version = (Get-ToolsetContent).docker.plugins | Where-Object { $_.plugin -eq 'compose' } | Select-Object -ExpandProperty version
        If ($version -ne 'latest') {
            $(docker compose version --short) | Should -BeLike "*$version*"
        } else {
            'docker compose version --short' | Should -ReturnZeroExitCode
        }
    }
}

Describe "yq" {
    It "yq" {
        "yq -V" | Should -ReturnZeroExitCode
    }
}

Describe 'Zstd' {
    It 'zstd' {
        'zstd --version' | Should -ReturnZeroExitCode
    }
}
