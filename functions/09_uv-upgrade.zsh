function uvupgradehelper() {
  $1 lock --upgrade && $1 sync
}

function uv-default-upgrade() {
  uvupgradehelper uv-default
}

function uv-upgrade() {
  uvupgradehelper uv
}
