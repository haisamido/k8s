.DEFAULT_GOAL := help

.PHONY:

SHELL=bash
export DIFF_PROGRAM:=vimdiff

# Pythonics
VENV_DIR=./.venv
PYTHON3=python3
PYTHON :=source ${VENV_DIR}/bin/activate && ${PYTHON3}

# https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
# https://www.youtube.com/watch?v=SUk_Nm5BiPw

directories: 
	mkdir -p ${VENV_DIR}

repo-add:
	helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/

install: repo-add
	helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard

create-admin-user: install
	kubectl apply -n kubernetes-dashboard -f token.yaml || true

generate-token: create-admin-user
	kubectl -n kubernetes-dashboard create token my-user

get-token-from-secret:
	kubectl -n kubernetes-dashboard get secret my-user-token -o yaml | grep token:

access: generate-token
	kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443
