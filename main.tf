provider "google" {
  project = "${var.gcp_project_id}"
}

resource "random_string" "password" {
  length = 16
  special = true
  override_special = "/@\" "
}

resource "google_container_cluster" "k8s" {
  count  = "${var.clusters}"

  name               = "${element(var.animals, count.index)}-cluster"
  description        = "k8s cluster"
  zone               = "${var.gcp_zone}"
  initial_node_count = "4"
  enable_kubernetes_alpha = "true"
  enable_legacy_abac = "true"

  master_auth {
    username = "hashi"
    password = "${random_string.password.result}"
  }

  node_config {
    machine_type = "${var.node_machine_type}"
    disk_size_gb = "${var.node_disk_size}"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}
