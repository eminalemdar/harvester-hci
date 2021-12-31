# Harvester HCI

This repository consists example Terraform codes for maintaining **Harvester** resources.

![](assets/Harvester-Symbol.png)

**Harvester** is an open source HCI solution built on enterprise-grade cloud native solutions like **Kubernetes**, **Longhorn** and **KubeVirt**.

## Folder Structure
```
├── README.md
├── assets
│   └── Harvester-Symbol.png
├── clusternetwork.tf
├── images.tf
├── networks.tf
├── provider.tf
└── vm.tf
```

In the repository there are example **Terraform** codes for creating an ***Image***, ***Network*** and ***Virtual Machine***. You can change the configurations and add resources according to your needs. You can follow the official [Terraform Documentation](https://registry.terraform.io/providers/harvester/harvester/latest) for creating additinal resources.

## Usage

- You need to have a running **Harvester** Cluster for creating these resources.
- You need to add the **Kubeconfig** of the **Harvester Cluster** to the [Provider](provider.tf) configuration.
- You can run **Terraform** commands for resource creation.
```bash
terraform init
```
```bash
terraform plan
```
```bash
terraform apply
```


## Cleanup

- You can delete the resources with
```bash
terraform destroy
```