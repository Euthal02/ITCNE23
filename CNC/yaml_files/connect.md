root@Tuxedo-Laptop:/home/mka/repos/ITCNE23/CNC/yaml_files# kind create cluster --name=kind-ingress --config=kind-cluster.conf --kubeconfig=./kubeconfig.yml
Creating cluster "kind-ingress" ...
 ✓ Ensuring node image (kindest/node:v1.31.0) 🖼
 ✓ Preparing nodes 📦 📦 📦 📦
 ✓ Writing configuration 📜
 ✓ Starting control-plane 🕹️
 ✓ Installing CNI 🔌
 ✓ Installing StorageClass 💾
 ✓ Joining worker nodes 🚜
Set kubectl context to "kind-kind-ingress"
You can now use your cluster with:

kubectl cluster-info --context kind-kind-ingress --kubeconfig ./kubeconfig.yml

Not sure what to do next? 😅  Check out https://kind.sigs.k8s.io/docs/user/quick-start/