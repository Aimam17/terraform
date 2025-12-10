
# Python Server
We are going to deploy python greeting server. This has two steps:
- Building docker image
- Helm deployment


## Docker build
Let's build docker by below commands
```
cd ops/docker
docker compose build
```

You will see docker image `greeting:latest` from `docker images`
You can push this image to any registry you want. We are going to use it next step for helm deployment.


## Helm deployment
You can use any k8s distribution to deploy the helm chart. One example is k3d
```
k3d cluster create greeting --kubeconfig-update-default
```

Then upload docker image to the cluster
```
k3d image import greeting:latest -c greeting
```


Then deploy the helm chart
```
helm upgrade greeting ops/helm/greeting -n greeting --install --create-namespace
```

## Question
The helm deployment will fail. Please find issue and resolve it.
If you use different k8s distribution, you might need to update helm chart. Feel free to modify it.
During interview please explain your solution. If you modify helm chart, please also explain what and why you changed.
