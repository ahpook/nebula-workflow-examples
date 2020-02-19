package nebula


workflow: {

	steps: [{
		name: "Step-1-Provision-K8s-cluster"
		input: [
			"echo \"Hello world. I am Step 1\"",
			"sleep 5",
		]
	}, {
		name: "Step-2-Notify-team"
		input: [
			"echo \"Hello world. I am Step 2\"",
			"sleep 2",
		]
		dependsOn: "Step-1-Provision-K8s-cluster"
	}, { 
		name: "Step-3-Deploy-supporting-services"
		input: [
			"echo \"Hello world. I am Step 3\"",
			"sleep 2",
		]
		dependsOn: "Step-1-Provision-K8s-cluster",
	},
	]
}