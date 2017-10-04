SCManager PowerShell Module
==========================

**SCManager module was designed to help disable remote Service Controller enumeration.**

## Table of Contents

* [Intnet](#Intent)
* [Usage](#Usage)
  * [Install the module](#Install)
  * [Functions](#Functions)
  * [Help](#Help)
* [Issues](#issues)
* [Todo](#Todo)
* [Credits](#Credits)

<a name="Intent"/>

## Intent

John Lambert showed on twitter how the Service Controller (SC) Manager can be hardened to block remote use of PSEXEC or similar tools.

This module is most of the time a wrapper around the sc.exe, to avoid to have to restart the computer for changes to apply.

The Set-SCManagerPermission adds a Deny to the network service (NT AUTHORITY\NETWORK, S-1-5-2).

Permissions cannot be set directly because they aren't always the same. 
It depends both on the version of Windows and what you run on the server or computer.

Permissions, their binary format of the Security Descriptor Definition Language (SDDL) string are stored the Security value under the key HKLM\SYSTEM\CurrentControlSet\Control\ServiceGroupOrder\Security. The value doesn't exist by default.


<a name="Usage"/>

## Usage

<a name="Install"/>

### Install the module

```powershell
# Check the mmodule on powershellgallery.com
Find-Module -Name SCManager -Repository PSGallery
```
``` 
??
```

```powershell
# Save the module locally in Downloads folder
Save-Module -Name SCManager -Repository PSGallery -Path ~/Downloads
```

Stop and please review the content of the module, I mean the code to make sure it's trustworthy :-)

You can also verify that the SHA256 hashes of downloaded files match those stored in the catalog file
```powershell
$HT = @{
    CatalogFilePath = "~/Downloads/SCManager/1.0.0/SCManager.cat"
    Path = "~/Downloads/SCManager/1.0.0"
    Detailed = $true
    FilesToSkip = 'PSGetModuleInfo.xml'
}
Test-FileCatalog @HT
# Make sure the catalog file is digitally signed
Get-AuthenticodeSignature "~/Downloads/SCManager/1.0.0/SCManager.cat"
# Make sure the manifest (.psd1) and the module (*.psm1) are signed as well
Get-ChildItem -Path ~/Downloads/SCManager -Include *.ps?1 -Recurse | Get-AuthenticodeSignature

```

```powershell
# Import the module
Import-Module ~/Downloads/SCManager/1.0.0/SCManager.psd1 -Force -Verbose
```

<a name="Functions"/>

### Check the command available
```powershell
Get-Command -Module SCManager
```
```
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-SCManagerPermission                            1.0.0      SCManager
Function        Restore-SCManagerPermission                        1.0.0      SCManager
Function        Set-SCManagerPermission                            1.0.0      SCManager
```
<a name="Help"/>

### Get-SCManagerPermission
```powershell
 Get-Help Get-SCManagerPermission -Full
```
```

NAME
    Get-SCManagerPermission

SYNOPSIS
    Get the current SC Manager permissions


SYNTAX
    Get-SCManagerPermission [<CommonParameters>]


DESCRIPTION
    Get the current SC Manager permissions


PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

INPUTS

OUTPUTS

    -------------------------- EXAMPLE 1 --------------------------

    PS C:\>Get-SCManagerPermission






    -------------------------- EXAMPLE 2 --------------------------

    PS C:\>Get-SCManagerPermission |

    Select Transl*,Secu*,AccessMask,AceType | ft -AutoSize





RELATED LINKS

```

### Set-SCManagerPermission
```powershell
 Get-Help Set-SCManagerPermission -Full
```
```

NAME
    Set-SCManagerPermission

SYNOPSIS
    Set the hardened SC Manager permissions


SYNTAX
    Set-SCManagerPermission [-WhatIf] [-Confirm] [<CommonParameters>]


DESCRIPTION
    Set the hardened SC Manager permissions by adding AccessDenied to NT AUTHORITY\NETWORK


PARAMETERS
    -WhatIf [<SwitchParameter>]

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -Confirm [<SwitchParameter>]

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

INPUTS

OUTPUTS

    -------------------------- EXAMPLE 1 --------------------------

    PS C:\>Set-SCManagerPermission -Whatif






    -------------------------- EXAMPLE 2 --------------------------

    PS C:\>Set-SCManagerPermission -Verbose -Confirm:$false







RELATED LINKS

```

### Restore-SCManagerPermission
```powershell
Get-Help Restore-SCManagerPermission -Full
```
```

NAME
    Restore-SCManagerPermission

SYNOPSIS
    Restore the default SC Manager permissions


SYNTAX
    Restore-SCManagerPermission [-WhatIf] [-Confirm] [<CommonParameters>]


DESCRIPTION
    Restore the default SC Manager permissions by removing AccessDenied to NT AUTHORITY\NETWORK


PARAMETERS
    -WhatIf [<SwitchParameter>]

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -Confirm [<SwitchParameter>]

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

INPUTS

OUTPUTS

    -------------------------- EXAMPLE 1 --------------------------

    PS C:\>Restore-SCManagerPermission -Whatif






    -------------------------- EXAMPLE 2 --------------------------

    PS C:\>Restore-SCManagerPermission -Verbose -Confirm:$false







RELATED LINKS

```

<a name="Issues"/>

## Issues
* None

<a name="Todo"/>

## Todo

#### Coding best practices
- [x] Use PSScriptAnalyzer module to validate the code follows best practices
- [ ] Write Pester tests for this module

<a name="Credits"/>

## Credits
Thanks go to:
* **[@JohnLaTwC](https://twitter.com/JohnLaTwC)**: 
