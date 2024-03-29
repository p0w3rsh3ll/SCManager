﻿@{

# Script module or binary module file associated with this manifest.
RootModule = 'SCManager.psm1'

# Version number of this module.
ModuleVersion = '1.0.2'

# ID used to uniquely identify this module
GUID = '9b50a79e-9c91-49fe-8428-12ec932f4ae2'

# Author of this module
Author = 'Emin Atac'

# Copyright statement for this module
Copyright = 'BSD 3-Clause'

# Description of the functionality provided by this module
Description = 'SCManager is a module that will help disable remote Service Controller enumeration and block the remote use of psexec.exe and sc.exe'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = '4.0'

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = '4.0'

# Functions to export from this module
FunctionsToExport = @('Restore-SCManagerPermission','Set-SCManagerPermission','Get-SCManagerPermission')

PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('security','defense','SCManager','PSEdition_Desktop','PSEdition_Core')

        # A URL to the license for this module.
        LicenseUri = 'https://opensource.org/licenses/BSD-3-Clause'

        # A URL to the main website for this project.
         ProjectUri = 'https://github.com/p0w3rsh3ll/SCManager'

    } # End of PSData hashtable

} # End of PrivateData hashtable

}