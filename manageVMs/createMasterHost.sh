#!/bin/bash
azure network public-ip create --resource-group $resourceGroupName \
    --name $publicIPName \
    --location $location \
    --allocation-method Static

azure network nic create --name $nicName \
    --resource-group $resourceGroupName \
    --location $location \
    --subnet-id $subnetId \
    --network-security-group-name $networkSecurityGroup \
    --public-ip-name $publicIPName

azure vm create --resource-group $resourceGroupName \
    --name $vmName \
    --location $location \
    --vm-size $vmSize \
    --subnet-id $subnetId \
    --nic-names $nicName \
    --os-type linux \
    --image-urn RedHat:RHEL:7.2:latest \
    --storage-account-name $storageAccountName \
    --admin-username $adminUserName \
    --admin-password $adminPassword \
    --disable-boot-diagnostics

azure vm disk attach-new $resourceGroupName $vmName 30
