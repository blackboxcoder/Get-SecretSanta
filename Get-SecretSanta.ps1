Function Get-SecretSanta{
    <#
    .SYNOPSIS
        This function generates randomly secret santa couples
    .DESCRIPTION
        You have to set on the parameter diffrent Gnomes that will play secret santa
        they will get mixed up and the output will show who is secret santa for whom
    .NOTES
        File Name      :Get-SecretSanta.ps1
        Date           :30.11.2016
        Author         :BlackBoxCoder 
        Prerequisite   :PowerShell V2.
        Copyright      :2016 BlackBoxCoder
        Customer       :My Own
    .LINK
        <None>
    .EXAMPLE
        Get-SecretSanta -Gnomes "Chris","Juergen","Alexandra","Natascha","Susanne","Bella","Jan","Fabian"
    .EXAMPLE
        <None>
    .Output
        Chris is Secret Santa for Natascha
        Juergen is Secret Santa for Chris
        Alexandra is Secret Santa for Fabian
        Natascha is Secret Santa for Susanne
        Susanne is Secret Santa for Juergen
        Bella is Secret Santa for Jan
        Jan is Secret Santa for Alexandra
        Fabian is Secret Santa for Bella
    #> 
    Param(
        [String[]] $Gnomes
    )
    $Sender = New-Object System.Collections.ArrayList
    $Receiver = New-Object System.Collections.ArrayList
    foreach($Gnome in $Gnomes){
        $Sender.Add($Gnome) |Out-Null
        $Receiver.Add($Gnome) |Out-Null
    } 
    foreach($Senderx in $Sender){
        $Random = $Receiver[ ( Get-Random -Maximum $( $Receiver.Count ) ) ]
        While($Random -eq $Senderx){
            $Random = $Receiver[ ( Get-Random -Maximum $( $Receiver.Count ) ) ]
        }
        Write-Host $Senderx -ForegroundColor Red -NoNewline
        Write-Host " is Secret Santa for " -NoNewline
        Write-Host $Random -ForegroundColor Red
        $Receiver.Remove($Random)
    }
}
