function ocgv_history {
    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    $selection = $input | Out-ConsoleGridView -Title "Select CommandLine from History" -OutputMode Single -Filter $line
    if ($selection) {
      [Microsoft.PowerShell.PSConsoleReadLine]::DeleteLine()
      [Microsoft.PowerShell.PSConsoleReadLine]::Insert($selection)
      if ($selection.StartsWith($line)) {
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor)
      }
      else {
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($selection.Length)
      }
    }
}

$parameters = @{
    Key = 'F7'
    BriefDescription = 'ShowMatchingHistoryOcgv'
    LongDescription = 'Show Matching History using Out-ConsoleGridView'
    ScriptBlock = {
      param($key, $arg)   # The arguments are ignored in this example
      Get-History | Sort-Object -Descending -Property Id -Unique | Select-Object CommandLine -ExpandProperty CommandLine |  ocgv_history
    }
}
Set-PSReadLineKeyHandler @parameters

$parameters = @{
    Key = 'Shift-F7'
    BriefDescription = 'ShowMatchingGlobalHistoryOcgv'
    LongDescription = 'Show Matching History for all PowerShell instances using Out-ConsoleGridView'
    ScriptBlock = {
      param($key, $arg)   # The arguments are ignored in this example
      $hist = [Microsoft.PowerShell.PSConsoleReadLine]::GetHistoryItems().CommandLine
      # reverse the items so most recent is on top
      [array]::Reverse($hist)
      $hist | Select-Object -Unique -First 1000 | ocgv_history
    }
}
Set-PSReadLineKeyHandler @parameters

# sunlong add for starship
Invoke-Expression (&starship init powershell)

# sunlong add for auto completion
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# sunlong Function to relaunch as Admin:
function Relaunch-Admin { Start-Process -Verb RunAs (Get-Process -Id $PID).Path }

# sunlong for prediction with history
# Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionSource HistoryAndPlugin

# sunlong prediction with listview
Set-PSReadLineOption -PredictionViewStyle ListView

# sunlong for psfzf key-bindings
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

Import-Module -Name Terminal-Icons
