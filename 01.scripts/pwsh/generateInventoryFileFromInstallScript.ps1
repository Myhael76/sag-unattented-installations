param (${file}, ${outFile}, ${sumVersionString}="10.5.0", ${sumPlatformString}="LNXAMD64", ${SUIF_VersionString}="1005", ${updateManagerVersion}="11.0.0.0000-0117", ${SumPlatformGroupString}="""UNX-ANY"",""LNX-ANY""")

# ATTENTION: this file implements an unsupported transformation, the logic may change in time

${lProductsCsv} = (Select-String -path "${file}" -pattern "InstallProducts=(.*)").Matches[0].Groups[1].Value

Write-Output "Products csv: ${lProductsCsv}"

if ( -not ${lProductsCsv} ){
    Write-Error "No product to install found in file ${file}, exiting"
    exit 1
}

${productsHash} = @{} #using a hash for unique values

foreach ($productString in ${lProductsCsv}.split(',')){
    $productCode=$productString.split('/')[-1]
    ${productsHash}["$productCode"] = "1"
}

if (${productsHash}.Count -gt 0){
    ${installedProducts} = @()
    foreach (${productId} in ${productsHash}.Keys){
        ${installedProducts} += (@{
            "productId" = ${productId}
            "displayName" = ${productId}
            "version" = ${sumVersionString}
        })
    }
    $document=@{
        "installedFixes" = @()
        "installedSupportPatches" = @()
        "envVariables" = @{
            "platformGroup" = @(${SumPlatformGroupString})
            "UpdateManagerVersion" = "${updateManagerVersion}"
            "Hostname" = "localhost"
            "platform" = "$sumPlatformString"
        }
        "installedProducts" = $installedProducts
    }
    $document | ConvertTo-Json -depth 100 | Out-File -Encoding "ascii" "${outFile}"
}else{
    Write-Error "No products"
}
