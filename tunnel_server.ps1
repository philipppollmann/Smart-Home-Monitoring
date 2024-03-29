$env_vars = Get-Content .env | ConvertFrom-StringData

ssh -L 30090:localhost:30090 $($env_vars.username)@$($env_vars.serverip)