consul kv put consul-alerts/config/checks/change-threshold 30
consul kv put consul-alerts/config/notifiers/slack/enabled true
consul kv put consul-alerts/config/notifiers/slack/username k8s.misa.com.vn
consul kv put consul-alerts/config/notifiers/slack/channel rd-alerts
consul kv put consul-alerts/config/notifiers/slack/detailed true
consul kv put consul-alerts/config/notifiers/slack/url https://hooks.slack.com/services/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



