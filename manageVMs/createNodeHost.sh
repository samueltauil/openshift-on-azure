#!/bin/bash
azure network nic create --name $nicName \
    --resource-group $resourceGroupName \
    --location $location \
    --subnet-id $subnetId


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
