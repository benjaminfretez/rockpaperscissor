# Rock-Paper-Scissors (PowerShell Script Game)
## introduction

In this script you play against the computer the classic Rock-Paper-Scissors game. 

![The script in action](attachments/Pasted%20image%2020230602204055.png)

## how it works

When you run the script it will ask you which of Rock💎, Paper🧻 or Scissors✂, which it will play against the random computer choice through the `Get-Random` PowerShell function.

![Alt text](attachments/Pasted%20image%2020230602204354.png)

In your terminal will appear representations of Rock💎, Paper🧻 or Scissors✂ labeled with the names **You've selected'** and **Computer**, followed by a red text telling you the final result.

![Alt text](attachments/Pasted%20image%2020230602210656.png)


## inputs

* Rock: *"r", "rock"*
* Paper: *"p", "paper"*
* Scissors: *"s", "scissor", "scissors"

## testing purposes stuff

There are some useful parameters that will help you test this program:

* `-fc` *(Force computer)* after this parameter you can force the computer play. You can use the inputs above to use this parameter.

* `-lang` *(Language)* you can set another language using this parameter, in this script is only avaliable spanish ("es", "español", "espanol", "spanish"). There are inputs for this language such as *"piedra", "o", "papel", "p", "tijera", "t"*.

* `-help` and `-about` are common parameters with no need to explain.

This script has been done under PowerShell 7.3.4 (not Windows PowerShell but it does work there too)
It's needed to be main.ps1 and variables.ps1 together on the same folder.

## contact

Any questions or concerns are welcome!

---
benjaminfretez
