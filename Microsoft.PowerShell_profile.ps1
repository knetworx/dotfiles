# The "bedrock" command lives at C:\Users\nick.heilmann\bin\bedrock.cmd (on PATH),
# so it works the same in PowerShell, cmd, and bash without a profile function.
function prompt {
    $Green = "$([char]0x1b)[92m"
    $Cyan  = "$([char]0x1b)[36m"
    $Reset = "$([char]0x1b)[0m"
    return "${Green}PS ${Cyan}$($ExecutionContext.SessionState.Path.CurrentLocation)${Reset}> "
}

# Speaks $text aloud - handy appended to a long-running command, e.g.:
#   .\BuildJuno.bat Editor Development; say "build complete"
function say {
    param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Text)
    Add-Type -AssemblyName System.Speech
    (New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak(($Text -join ' '))
}
