{{/* The file format itself does not support comments, so I use golang text/template comments here. */}}
{{/* Reference for statsd metric names emitted by Swift: */}}
{{/* <http://docs.openstack.org/developer/swift/admin_guide.html#reporting-metrics-to-statsd> */}}
{{/* Reference for this file's format: */}}
{{/* <https://github.com/prometheus/statsd_exporter#metric-mapping-and-configuration> */}}

{{/* #################### proxy metrics coming from the proxy-logging middleware #################### */}}

swift.proxy-server.*.policy.*.*.*.timing
name="swift_proxy"
type="$1"
policy="$2"
method="$3"
status="$4"

swift.proxy-server.*.policy.*.GET.*.first-byte.timing
name="swift_proxy_firstbyte"
type="$1"
policy="$2"
status="$3"

swift.proxy-server.*.policy.*.*.*.xfer
name="swift_proxy_transfer"
type="$1"
policy="$2"
method="$3"
status="$4"

swift.proxy-server.*.*.*.timing
name="swift_proxy"
type="$1"
policy="all"
method="$2"
status="$3"

swift.proxy-server.*.GET.*.first-byte.timing
name="swift_proxy_firstbyte"
type="$1"
policy="all"
status="$2"

swift.proxy-server.*.*.*.xfer
name="swift_proxy_transfer"
type="$1"
policy="all"
method="$2"
status="$3"

{{/* #################### storage server timing metrics #################### */}}

swift.account-server.*.timing
name="swift_storage_server"
type="account"
method="$1"
status="ok"

swift.account-server.*.errors.timing
name="swift_storage_server"
type="account"
method="$1"
status="error"

swift.container-server.*.timing
name="swift_storage_server"
type="container"
method="$1"
status="ok"

swift.container-server.*.errors.timing
name="swift_storage_server"
type="container"
method="$1"
status="error"

swift.object-server.*.timing
name="swift_storage_server"
type="object"
method="$1"
status="ok"

swift.object-server.*.errors.timing
name="swift_storage_server"
type="object"
method="$1"
status="error"

swift.object-server.*.*.timing
name="swift_storage_server_by_device"
type="object"
method="$1"
status="ok"
device="$2"

{{/* #################### background service metrics #################### */}}

swift.object-replicator.partition.*.count.*
name="swift_object_replicator_partition"
action="$1" {{/* "update" or "delete" */}}
device="$2"

swift.object-replicator.partition.*.timing
name="swift_object_replicator"
action="$1"

{{/* #################### remove superfluous "timing" word from timer names #################### */}}

swift.account-auditor.timing
name="swift_account_auditor"

swift.account-replicator.timing
name="swift_account_replicator"

swift.container-auditor.timing
name="swift_container_auditor"

swift.container-replicator.timing
name="swift_container_replicator"

swift.container-updater.timing
name="swift_container_updater"

swift.object-auditor.timing
name="swift_object_auditor"

swift.object-expirer.timing
name="swift_object_expirer"

swift.object-replicator.timing
name="swift_object_replicator"

swift.object-updater.timing
name="swift_object_updater"