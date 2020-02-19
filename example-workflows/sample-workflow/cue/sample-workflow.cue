package nebula

Workflow :: {
  apiVersion:     *"v1" | string
  description: *"Default description" | string
	kind: "Workflow" // there's only one "kind" at this point
	parameters?: { <_>: Parameter }
	steps: [Step, ...Step]
}

Parameter :: {
	default: string
	description?: string	
}

Step :: {
	name: string
	description?: string 
	image: *"alpine:latest" | string
	input: [...string]
	dependsOn?: string | [string, ...string]
}
workflow: Workflow

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