resource "harvester_network" "vm-network" {
  name      = "vm-network"
  namespace = "default"
  vlan_id   = 1 #Change
}