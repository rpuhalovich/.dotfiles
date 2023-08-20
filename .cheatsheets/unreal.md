# Unable to build project

If you get an error like the following:

```
Missing test_vscode Modules
The following modules are missing or built with a different engine version:
test_vscode
Would you like to rebuild them now?
```

Try opening the project's `.uproject` file and setting the plugins' `Enabled` field to `false`. See example below:

```json
{
	"FileVersion": 3,
	"EngineAssociation": "5.2",
	"Category": "",
	"Description": "",
	"Modules": [
		{
			"Name": "test_vscode",
			"Type": "Runtime",
			"LoadingPhase": "Default"
		}
	],
	"Plugins": [
		{
			"Name": "ModelingToolsEditorMode",
			"Enabled": false,
			"TargetAllowList": [
				"Editor"
			]
		}
	]
}
```
