---
external help file: Get-AKVSecret-help.xml
Module Name: Get-AKVSecret
online version:
schema: 2.0.0
---

# Get-AKVSecret

## SYNOPSIS
Retrieves a secret from Azure Key Vault

## SYNTAX

```
Get-AKVSecret [-tenantId] <String> [-clientId] <String> [-clientSecret] <String> [-vaultName] <String>
 [-vaultSecret] <String> [<CommonParameters>]
```

## DESCRIPTION
Retrieves a secret from Azure Key Vault via the REST API

## EXAMPLES

### EXAMPLE 1
```
Get-AKVSecret -tenantId $tenantId -clientId $clientId -clientSecret $clientSecret -vaultSecret 'hello'
```

world

## PARAMETERS

### -tenantId
The tenantId of the SPN that has rights to get secrets from the Azure key vault

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -clientId
The tenantId of the SPN that has rights to get secrets from the Azure key vault

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -clientSecret
The tenantId of the SPN that has rights to get secrets from the Azure key vault

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -vaultName
The name of the Azure key vault

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: Asifkeyvault
Accept pipeline input: False
Accept wildcard characters: False
```

### -vaultSecret
The name of the secret to retrieve from the Azure key vault

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. You cannot pipe objects to Get-AKVSecret.
## OUTPUTS

### System.String. Get-AKVSecret returns a string with the value of the secret.
## NOTES

## RELATED LINKS
