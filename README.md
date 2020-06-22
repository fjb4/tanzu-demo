![Account Service CI](https://github.com/fjb4/tanzu-demo/workflows/Account%20Service%20CI/badge.svg)

![Confirmation Service CI](https://github.com/fjb4/tanzu-demo/workflows/Confirmation%20Service%20CI/badge.svg)

![Payment Service CI](https://github.com/fjb4/tanzu-demo/workflows/Payment%20Service%20CI/badge.svg)

![Tanzu](tanzu-logo.png)

# VMware Tanzu Demo

Demo material for developers on [VMware Tanzu](https://tanzu.vmware.com/).

Consists of three [Spring Boot](https://spring.io) microservices, communicating over [RabbitMQ](), backed by a Redis key value store, all running on Kubernetes.
When source code changes, the applications are rebuilt using [Build Service](https://tanzu.vmware.com/build-service) and redeployed to [Enterprise PKS](https://cloud.vmware.com/vmware-enterprise-pks) using ArgoCD GitOps.

Both Kubernetes clusters are managed using [Mission Control](https://tanzu.vmware.com/mission-control) and both infrastructure, Kubernetes, applications and services are monitored using [Observability by Wavefront](https://tanzu.vmware.com/observability).

## Use Case - Banking Application

#### Application Architecture

#### Deployment Diagram

#### Continuous Delivery Diagram

## Installation

Prior to demoing:
- Copy the `config.template.yml` to config.yml and fill in the values.
- Create the Kubernetes clusters by running `create-clusters.sh`.
- After the clusters have been created:
  - Run `get-kubeconfig.sh > ~/.kube/config` to overwrite your kubeconfig file with connection information for the new clusters.
  - Run `prep-clusters.sh`

Then follow the instructions in the `setup_all.sh` script to install everything from scratch.

Alternatively, install the different components by running the various setup scripts.

- Install kpack using `01-install-kpack.sh`.
- Install argocd using `02-install-argocd.sh`.
- Configure the credentials for the various services in `03-configure-credentials.sh`.
- Configure the GitOps resources using `03-configure-gitops.sh`.

To access the Argo CD user interface:
- Get the autogenerated password `kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2 | pbcopy`.
- Run `kubectl port-forward svc/argocd-server -n argocd 8080:443`.
- Open `http://localhost:8080/` in your browser and login as `admin` with the above password.

When you're done, delete all the clusters by running `delete-clusters.sh`.
