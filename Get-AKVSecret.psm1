
function Get-AKVSecret {
        <#
        .SYNOPSIS
        Retrieves a secret from Azure Key Vault

        .DESCRIPTION
        Retrieves a secret from Azure Key Vault via the REST API

        .PARAMETER tenantId
        The tenantId of the SPN that has rights to get secrets from the Azure key vault

        .PARAMETER clientId
        The tenantId of the SPN that has rights to get secrets from the Azure key vault

        .PARAMETER clientSecret
        The tenantId of the SPN that has rights to get secrets from the Azure key vault

        .PARAMETER vaultName
        The name of the Azure key vault

        .PARAMETER vaultSecret
        The name of the secret to retrieve from the Azure key vault

        .INPUTS
        None. You cannot pipe objects to Get-AKVSecret.

        .OUTPUTS
        System.String. Get-AKVSecret returns a string with the value of the secret.

        .EXAMPLE
        C:\PS>  Get-AKVSecret -tenantId $tenantId -clientId $clientId -clientSecret $clientSecret -vaultSecret 'hello'
        world
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true)]
        [String]$tenantId,

        [Parameter(Mandatory=$true)]
        [String]$clientId,

        [Parameter(Mandatory=$true)]
        [String]$clientSecret,

        [Parameter(Mandatory=$true)]
        [String]$vaultName = "asifkeyvault",

        [Parameter(Mandatory=$true)]
        [String]$vaultSecret
    )

    Begin {

        $tokenEndpoint = {https://login.windows.net/{0}/oauth2/token} -f $tenantId
        $resourceURL = "https://vault.azure.net";

        $Body = @{
            'resource'= $resourceURL
            'client_id' = $clientId
            'grant_type' = 'client_credentials'
            'client_secret' = $clientSecret
        }

        # Create payload for Rest API call
        $authParams = @{
            ContentType = 'application/x-www-form-urlencoded'
            Headers = @{'accept'='application/json'}
            Body = $Body
            Method = 'POST'
            URI = $tokenEndpoint
        }
    }

    Process {

        Try {
            # Get auth token to be used in the vault secret api call
            Write-Verbose "Getting auth token..."
            $token = Invoke-RestMethod @authParams
        } Catch {
            Write-Error $_
            Exit(1)
        }

        # Generate vault secret query URL
        $vaultEndpoint = "https://$($vaultName).vault.azure.net/secrets/$($vaultSecret)?api-version=2016-10-01".ToString()

        # Create payload for Rest API call
        $vaultParams = @{
            Headers = @{
                "Authorization" = "Bearer $($token.access_token)"
                "Content-Type"  = "application/json"
            }
            Method = 'GET'
            URI = $vaultEndpoint
        }

        Write-Verbose "Getting secret from vault..."
        $response = Invoke-RestMethod @vaultParams
    }

    End {
         $response.value
    }
}
