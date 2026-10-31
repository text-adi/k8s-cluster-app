{{/*
Expand the name of the mqtt2prometheus component.
*/}}
{{- define "mqtt2prometheus.name" -}}
{{- default "mqtt2prometheus" .Values.mqtt2prometheus.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified name for mqtt2prometheus resources.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "mqtt2prometheus.fullname" -}}
{{- if .Values.mqtt2prometheus.fullnameOverride }}
{{- .Values.mqtt2prometheus.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "mqtt2prometheus.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Chart label value for mqtt2prometheus resources.
*/}}
{{- define "mqtt2prometheus.chartLabel" -}}
{{- printf "mqtt2prometheus-%s" .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels for mqtt2prometheus resources.
*/}}
{{- define "mqtt2prometheus.labels" -}}
helm.sh/chart: {{ include "mqtt2prometheus.chartLabel" . }}
{{ include "mqtt2prometheus.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for mqtt2prometheus resources.
*/}}
{{- define "mqtt2prometheus.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mqtt2prometheus.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Name of the ServiceAccount used by mqtt2prometheus.
*/}}
{{- define "mqtt2prometheus.serviceAccountName" -}}
{{- if .Values.mqtt2prometheus.serviceAccount.create }}
{{- default (include "mqtt2prometheus.fullname" .) .Values.mqtt2prometheus.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.mqtt2prometheus.serviceAccount.name }}
{{- end }}
{{- end }}
