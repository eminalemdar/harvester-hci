resource "harvester_virtualmachine" "ubuntu20" {
  depends_on = [harvester_image.ubuntu20, harvester_network.vm-network]

  name        = "ubuntu"
  description = "" # You can add description

  tags = {
    Name = "ubuntu"
  }

  cpu    = 2
  memory = "2Gi"

  start        = true
  hostname     = "ubuntu"
  machine_type = "q35"

  network_interface {
    name         = "nic-1"
    network_name = "default/vm-network"
  }

  network_interface {
    name         = "nic-2"
    model        = "virtio"
    type         = "bridge"
    network_name = "default/management-network"
  }

  disk {
    name       = "rootdisk"
    type       = "disk"
    size       = "10Gi"
    bus        = "virtio"
    boot_order = 1

    image       = "default/ubuntu20"
    auto_delete = true
  }

  disk {
    name        = "datadisk"
    type        = "disk"
    size        = "20Gi"
    bus         = "virtio"
    auto_delete = true
  }

  cloudinit { # You can change the cloudinit configurations
    user_data    = <<-EOF
      #cloud-config
      user: ubuntu
      password: password 
      chpasswd:
        expire: false
      ssh_pwauth: true
      package_update: true
      packages:
        - qemu-guest-agent
      runcmd:
        - - systemctl
          - enable
          - '--now'
          - qemu-guest-agent
      EOF
    network_data = "" 
  }
}