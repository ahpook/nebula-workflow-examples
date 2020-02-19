package nebula

Workflow :: {
	apiVersion:  *"v1" | string
	description: *"Default description" | string
	kind:        "Workflow" // there's only one "kind" at this point
	parameters?: {
		[string]: Parameter
	}
	steps: [Step, ...Step]
}

Parameter :: {
	default:      string
	description?: string
}

Step :: {
	name:        string
	description: *"" | string
	image:       *"alpine:latest" | string
	input: [...string]
	dependsOn?: string | [string, ...string]
}
workflow: Workflow
