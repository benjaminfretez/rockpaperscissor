# RPS_PPT (Rock Paper Scissor, Piedra Papel Tijera)
# Author: benjaminfretez

<#
.SYNOPSIS
    Rock Paper Scissor Game
.DESCRIPTION
    This script allows you to play a Rock Paper Scissor game against the computer.
.PARAMETER lang
    Specifies the language to use for the game. Available options are "english" and "spanish".
.PARAMETER help
    Displays the help information.
.PARAMETER fc
    Forces the computer to choose a specific move. Available options are, for instance, "rock", "paper", and "scissor".
.EXAMPLE
    .\main.ps1 -lang english # Play in English (Default)
.EXAMPLE
    .\main.ps1 -lang spanish # Play in Spanish
.EXAMPLE
    Play the game, forcing the computer to choose "rock".
    .\main.ps1 -fc rock
#>

param(
	[string]$lang, # Language Select
	[switch]$help, # Help Switch
	[string]$fc, # Force Computer
	[switch]$about, # About this Program
	[switch]$ansi
)

function warn([string]$message){
	Write-Host -NoNewline "Warning: " -ForegroundColor Yellow
	Write-Host $message -ForegroundColor White
}

function red([string]$message){
	Write-Host $message -ForegroundColor Red
}

function tip([string]$message){
	Write-Host -NoNewline "Tip: " -ForegroundColor Green
	Write-Host $message -ForegroundColor White
}

. .\variables.ps1 
# The dot sourcing feature lets you run a script in the
# current scope instead of in the script scope. When you 
# run a script that is dot sourced, the commands in the 
# script run as though you had typed them at the command prompt.

# Microsoft Docs

if (-not $english){
	red "There's not variables.ps1 or it's something incorrect"
	exit
}

if ($help){
	#Write-Host "No help! Go find it somewhere else."

	Get-Help -Name $MyInvocation.MyCommand.Path -Full
	exit
}
elseif($about){
	if($ansi){ 
		$PSStyle.OutputRendering = 'Ansi'
		Write-Host -NoNewLine $astrucolor 
	}
	else{ Write-Host $astrukot }
	Write-Host "benjaminfretez"
	exit
}

if ($lang -in "es", "español", "espanol", "spanish"){
	# Language is Spanish.
	#warn "hi"
	$langstr = $spanish
}
elseif ($lang -in "en", "english"){
	tip "Did you know English is the Default language for this game? :)"
	$langstr = $english
}
elseif(-not $lang){
	$langstr = $english
}
else{
	warn "Wow! You talk that language? Sorry, but I don't know it."
	$langstr = $english
}

$option = Read-Host $langstr.options

if ($option -in "o", "piedra", "r", "rock", $langstr.rock)
{
	$yours = $piedra
	Write-Output $langstr.chose $yours
}
elseif ($option -in "p", "papel", "paper", $langstr.paper)
{
	$yours = $papel
	Write-Output $langstr.chose $yours
}
elseif ($option -in "i","s", "t", "tijera", "scissors", $langstr.scissor -or $option -like "sc*")
{
	$yours = $tijera
	Write-Output $langstr.chose $yours
}
else
{
	$yours = "None"
}

$ppt = $piedra, $papel, $tijera
$computer = $ppt | Get-Random 

if($fc -in $rockpa){ $computer = $piedra }
elseif($fc -in $pappar){ $computer = $papel }
elseif($fc -in $scissp){ $computer = $tijera }
elseif(-not $fc){}
else{warn "Do you want also the computer wash your dishes?"}

Write-Output $langstr.computer $computer

if($yours -eq "None") { red $langstr.kick }

if($yours -eq $computer){
	red $langstr.tie 
	exit
}

if($computer -eq $tijera)
{
	if($yours -eq $piedra)
	{
		red $langstr.win
	}
	elseif($yours -eq $papel)
	{
		red $langstr.lose
	}
}
elseif($computer -eq $papel)
{
	if($yours -eq $tijera)
	{
		red $langstr.win
	}
	elseif($yours -eq $piedra)
	{
		red $langstr.lose
	}
}
elseif($computer -eq $piedra)
{
	if($yours -eq $papel)
	{
		red $langstr.win
	}
	if($yours -eq $tijera)
	{
		red $langstr.lose
	}
}

exit
