add-type -AssemblyName System.Windows.Forms
add-type -assembly microsoft.visualbasic

if ($Args[0] -eq $null) {
    Write-Host "引数が不正です。";
    exit;
} else {
    [Windows.Forms.Clipboard]::SetText($Args[0]);
}

$is_opend = 0;
$processes_arr = Get-Process;
foreach($process in $processes_arr) {
    if ($process.ProcessName.IndexOf("CStyle") -ge 0) {
        $is_opend = 1;
        [Microsoft.VisualBasic.Interaction]::AppActivate($process.ID);
    }
}
if ($is_opend -eq 0) {
    Invoke-Item "C:\Daisen\C-Style for e-Gadget V19017\CStyle_EGCore.exe";
    Start-Sleep -m 1000;
}


[System.Windows.Forms.SendKeys]::SendWait("%fo");

Start-Sleep -m 1000;

[System.Windows.Forms.SendKeys]::SendWait("^v");
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}");

Start-Sleep -m 300;

[System.Windows.Forms.SendKeys]::SendWait("%pb");