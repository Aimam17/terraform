# 👋 Welcome to the SecDevOps Candidate Challenge

We encourage you to:
- **Ask questions** — If something is unclear, reach out via our Slack workspace.
- **Stay connected** — Provide a quick status update at least once every 24 hours so we can support you and keep the process moving.
- **Document your work** — The `ENHANCEMENTS.md` file is your place to explain choices, trade-offs, and lessons learned.

Remember, this is as much about *how* you work as it is about the end result. Good luck, and have fun!


## AI Tool Usage

AI assistance is acceptable in this challenge, but any output must be thoroughly tested before it is implemented. In this section, explain which AI tools you used (if any), what you used them for, and how you validated that the AI-generated content was correct, secure, and appropriate for this environment.

## 🚀 Getting Started

This repository is public, so your work must be kept private.

1. **Fork this repository** into your own **private** GitLab account.  
   - When forking, set the **Visibility Level** to **Private** so other candidates cannot see your work.

3. **Work entirely in your private fork**  
   - Commit all code, manifests, and documentation changes to your private fork only.

4. **Submission**  
   - Grant us access to your private fork.



## 📄 Included Files

| File          | Purpose                                           |
|---------------|---------------------------------------------------|
| `index.html`  | Static HTML file to serve from NGINX              |
| `values.yaml` | Helm values file to mount configs and serve HTML |

## 🚀 Deployment Instructions

> Prerequisites: A Kubernetes cluster (e.g. Minikube) and Helm installed

### 1. Create Kubernetes ConfigMaps

```bash
kubectl create configmap nginx-html --from-file=index.html
```

### 2. Add the Bitnami Helm Repository

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

### 3. Install NGINX with Your Custom Config

```bash
helm install my-nginx bitnami/nginx -f values.yaml
```

### 4. Verify Deployment

```bash
kubectl get pods
kubectl port-forward svc/my-nginx 8080:80
```

Then visit [http://localhost:8080](http://localhost:8080)

## 🛡️ Required Enhancements

You must implement the following enhancements. You’re free to choose any tools, controllers, or approaches—but you **must document** what you chose and **why** (trade-offs, security implications, ops impact).

At the end, create a new markdown file named **`ENHANCEMENTS.md`** in the project root.  
This file must document:
- All changes you made to implement the enhancements
- The tools you selected for each task
- Why you selected them (advantages, trade-offs, relevant experience)
- The steps to reproduce your setup
- Any issues or limitations you encountered

---

### 1) Ingress with Hostname
**Goal:** Expose the service at a hostname (e.g., `nginx.localhost`).

- ✅ **Acceptance criteria**
  - `GET http://nginx.localhost/` returns the custom page.
  - Host-based routing is configured (no raw NodePort/port-forward).
  - Ingress is reproducible via code (Helm values or manifests).

- 📝 **Document in `ENHANCEMENTS.md`**
  - Which controller and why (features, familiarity, simplicity).
  - How DNS/hosts resolution is handled locally.
  - Any annotations you added and why.

---

### 2) NetworkPolicy for Restricted Access
**Goal:** Lock down pod ingress to only what’s required.

- ✅ **Acceptance criteria**
  - A `NetworkPolicy` exists in the namespace that **denies all by default** and **allows only** ingress traffic from the chosen ingress controller to the NGINX pod.
  - Lateral pod-to-pod access is blocked unless explicitly allowed.

- 📝 **Document in `ENHANCEMENTS.md`**
  - The selectors you used (labels/namespaces) and why.
  - How you verified enforcement (tests/commands).

---

### 3) TLS Termination with Certificates
**Goal:** Serve the site at `https://nginx.localhost/` with a valid certificate for your environment.

- ✅ **Acceptance criteria**
  - Browser (or curl) shows HTTPS with a certificate your setup trusts (self-signed, local CA, or public ACME if applicable).
  - Ingress routes HTTPS traffic to NGINX successfully.

- 📝 **Document in `ENHANCEMENTS.md`**
  - The issuer/CA you chose and why.
  - Renewal/rotation considerations for a real environment.

### 4) Dockerfile Review & Hardening

  **Goal:** Review the provided Dockerfile and identify security, compliance, and operational risks. Apply hardening changes to address these issues.

  - ✅ **Acceptance criteria**
    - All high and critical risks are mitigated.
    - Dockerfile follows container security best practices.
    - The image builds successfully and runs the intended application.

  - 📝 **Document in `ENHANCEMENTS.md`**
    - List each issue you found in the original Dockerfile.
    - Explain why it is a security/operational concern.
    - Describe the change you made to address it.
    - Include the final, hardened Dockerfile in the repository.


---

### Deliverables

- ✅ Working manifests/Helm values committed to the repo.
- ✅ **`ENHANCEMENTS.md`** file containing:
- Tools chosen for each enhancement and why.
- Security implications and trade-offs.
- Exact steps to reproduce and validate success.


## 🧹 Cleanup

```bash
helm uninstall my-nginx
kubectl delete configmap nginx-custom-conf nginx-html
```