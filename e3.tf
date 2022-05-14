terraform {
  required_version = ">= 1.1.0"
}

module "voodoo" {
  source = "./numeric-voodoo//"
  log_messages = [
    "2022-01-02 15:12:41 | INFO | Found Fragment: 192ry168x1 ----1",
    "2022-01-02 15:13:41 | INFO | Found Fragment: 192 rt168x1 --x--2",
    "2022-01-02 15:14:41 | ERROR | Found Fragment: 192yr t168p1 --y--3",
    "2022-01-02 15:15:41 | INFO | Found Fragment: 192h wrz168 1 -z---2",
    "2022-01-02 15:16:40 | CRITICAL | Suspicious Fragment: 192r txxs168x1 ---  -5",
    "2022-01-02 15:16:41 | CRITICAL | Suspicious Fragment: 192 rt168xree1 - -z --5",
    "2022-01-02 15:17:41 | INFO | Found Fragment: 192rt168x1 --- -1",
    "2022-01-02 15:18:41 | CRITICAL | Suspicious Fragment: 192rxs t168xl kk1 --e- e   -7",
    "2022-01-02 15:19:41 | INFO | Found Fragment: 192rt168bl ax1 ----     2"
  ]
}

# Expected:
# [
#   ["192", "168", "1", "5"],
#   ["192", "168", "1", "7"],
# ]
output fragment_digits {
  value = module.voodoo.fragment_digits
}

# Expected: ["192.168.1.5", "192.168.1.7"]
output fragment_ips {
  value = module.voodoo.fragment_ips
}
