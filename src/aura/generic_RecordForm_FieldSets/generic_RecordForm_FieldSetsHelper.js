//generic_recordForm_FieldSets helper;
({
	getFieldsetHandler: function (component, event, helper) {
		//call aura method from service component:
		component.find("service").callApex(component, "c.getFieldSetMember",
			{
				"objectName": component.get("v.sObjectName"),
				"fieldSetName": component.get("v.fieldsetSelected")

			},
			this.getFieldsetSuccess);
	},

	// getFieldsetSuccess pocesses the response from server and service component.
	// I have simplified this return from apex since we dont need anything fancy
	// recordForm takes a String array (fields = v.fieldsArray
	getFieldsetSuccess: function (component, returnValue) {
		var resultArray = [];
		for (var i = 0; i < returnValue.length; i++) {
            resultArray.push(returnValue[i]);
		}
		component.set("v.fieldsArray", resultArray);

	},

	showToast: function (params) {
		var toastEvent = $A.get("e.force:showToast");
		if (toastEvent) {
			toastEvent.setParams(params);
			toastEvent.fire();
		} else {
			alert("more code here");
		}
	},
})
