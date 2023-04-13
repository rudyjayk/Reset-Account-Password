$bool = $true

while($bool){

    $User = Read-Host -Prompt 'Input User to have their password reset'
    $Decision = Read-Host -Prompt "`nYou have inputted user $User`nAre you sure you want to reset $User password? (Yes or No)"

    if($Decision -like 'No'){
        
        $redo = Read-Host -Prompt "Do you want to enter another User? (Yes or No)"

        if($redo -like 'Yes'){
            Write-Host "`nRestarting Process..."
            Clear-Host
            Continue    
        }
        elseif($redo -like 'No'){
            Write-Host "`nTerminating Script!"
            Exit
        }
        else{
            Write-Host "`nNot a valid input, Terminating Script!"
            Exit
        }
    }
    elseif($Decision -like 'Yes'){
        
        $pw = Read-Host -Prompt "`nEnter password" -AsSecureString
        Set-ADAccountPassword -Identity $User -NewPassword $pw -Reset
        
        Write-Host "`nPassword has been reset!!"

        $bool = $false
    }
    else{
          
        Write-Host "`nNot a valid input"
        $redo = Read-Host -Prompt "Do you want to enter another User? (Yes or No)"

        if($redo -like 'Yes'){
            Write-Host "`nRestarting Process..."
            Clear-Host
            Continue    
        }
        elseif($redo -like 'No'){
            Write-Host "`nTerminating Script!"
            Exit
        }
        else{
            Write-Host "`nNot a valid input, Terminating Script!"
            Exit
        }
    }

}

Write-Host "`nUser is ready to sign in"
Exit

