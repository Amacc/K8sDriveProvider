using namespace System.Management.Automation
using namespace System.Management.Automation.Provider
using namespace System.Collections.ObjectModel

[CmdletProvider(
   "K8s",
   [System.Management.Automation.Provider.ProviderCapabilities]::None
)]
class K8sProvider : NavigationCmdletProvider {

    [boolean] IsValidPath([string] $path){ return $true; }

    [Collection[PSDriveInfo]] InitializeDefaultDrives() {
        [PSDriveInfo] $drive = [PSDriveInfo]::new(
            "K8sDrive", $this.ProviderInfo, "", "", $null
        );
        return @($drive);
    }

    [bool] ItemExists([string] $path){ return $true; }

    [bool] IsItemContainer([string] $path) { return $true; }

    [void] GetChildItems([string] $path, [bool] $recurse) {
        $this.WriteItemObject("Hello", "Hello", $true);
    }
}

$t = [K8sProvider]::new()
$t.InitializeDefaultDrives()

return $t