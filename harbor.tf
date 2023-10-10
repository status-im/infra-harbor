module "harbor" {
  source     = "github.com/status-im/infra-tf-digital-ocean"
  host_count = 1
  name       = "node"
  env        = "harbor"
  group      = "harbor"
  stage      = "registry"
  type       = "s-2vcpu-4gb"
  domain     = var.domain

  open_tcp_ports = ["80", "443"]

}


resource "cloudflare_record" "harbor" {
  zone_id = local.zones["status.im"]
  name    = "harbor"
  type    = "CNAME"
  proxied = false
  value   = "proxy.infra.status.im"
}
