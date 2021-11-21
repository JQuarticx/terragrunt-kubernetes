locals {
  user_data = base64encode(templatefile("${path.module}/userdata.sh.tpl", {
    cluster_name     = var.cluster_name
    worker_node_name = var.team
    }
  ))
}
