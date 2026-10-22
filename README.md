\# Smart Task Management System: End-to-End DevOps



Microservices app (React, API gateway, auth, task, notification, report, MongoDB) with a full DevOps flow.



| Folder | Purpose |

| --- | --- |

| frontend, api-gateway, \*-service | App code with a Dockerfile per service |

| docker-compose.yml | Local run and image build |

| Jenkinsfile | CI: checkout, install, build, push images to Docker Hub |

| terraform/ | AWS VPC, security groups, EC2 nodes |

| k8s-manifests/ | Raw Kubernetes YAML (Deployments, Services, ConfigMap, Secret, PVC, Ingress, HPA) |

| stms-chart/ | Helm chart with values-dev.yaml / values-prod.yaml, deployed by Argo CD |



Flow: GitHub → Jenkins → Docker Hub → Helm chart in Git → Argo CD → Kubernetes (kubeadm) → Prometheus / Grafana

