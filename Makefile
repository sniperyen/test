i:
	helm install . --name test --namespace sy \
	--set ingress.enabled=true \
	--set-string ingress.annotations."kubernetes\.io/tls-acme"="true" \
	--set ingress.hosts[0]="hello.codreamer.online" \
	--set ingress.tls[0].secretName=test-tls \
	--set ingress.tls[0].hosts[0]="hello.codreamer.online" \
	# --dry-run --debug \

d:
	helm del --purge test

cert:
	kubectl get clusterissuer,issuer,certificates --all-namespaces

des:
	kubectl -n sy describe certificate.certmanager.k8s.io/test-tls
