```bat
@echo off
title HD-Player - High Priority
echo ========================================
echo   HD-Player.exe Priority Optimizer
echo ========================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "$p = Get-Process -Name 'HD-Player' -ErrorAction SilentlyContinue; if (!$p) { Write-Host 'HD-Player.exe is not running.' } else { foreach ($proc in $p) { try { $proc.PriorityClass = 'High'; Write-Host ('PID ' + $proc.Id + ' set to HIGH priority.') } catch { Write-Host ('Failed for PID ' + $proc.Id + '. Try running as administrator.') } } }"

echo.
echo Note: Run again after restarting BlueStacks.
pause
```