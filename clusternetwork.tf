resource "harvester_clusternetwork" "cluster_network" {
  lifecycle {
    prevent_destroy = true
  }
  name                 = "cluster-network"
  enable               = true
  default_physical_nic = "ens33"
}