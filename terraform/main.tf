resource "yandex_vpc_network" "mnt-ansible-03-net" {
  name = "Ansible03Net"
}

resource "yandex_vpc_subnet" "mnt-ansible-03-subnet" {
  name           = "Ansible03Subnet"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.mnt-ansible-03-net.id}"
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_compute_instance" "el-instance" {
  name = "el-instance"
  folder_id = "b1ghsnt0etlu2skqlaep"

  resources {
    cores  = 2
    core_fraction = 20
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd81hgrcv6lsnkremf32"
      size = 5
      type = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.mnt-ansible-03-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "anything:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

resource "yandex_compute_instance" "kib-instance" {
  name = "kib-instance"
  folder_id = "b1ghsnt0etlu2skqlaep"

  resources {
    cores  = 2
    core_fraction = 20
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd81hgrcv6lsnkremf32"
      size = 5
      type = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.mnt-ansible-03-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "zubarev_va:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

resource "yandex_compute_instance" "app-instance" {
  name = "app-instance"
  folder_id = "b1ghsnt0etlu2skqlaep"

  resources {
    cores  = 2
    core_fraction = 20
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd81hgrcv6lsnkremf32"
      size = 5
      type = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.mnt-ansible-03-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "zubarev_va:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }
}