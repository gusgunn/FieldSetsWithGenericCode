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
	// recordForm takes a String array (fields = v.fieldsArray
	getFieldsetSuccess: function (component, returnValue) {
		//console.log('getFieldsetSuccess-->' + returnValue.length);
		var resultParsed = JSON.parse(returnValue);
		var resultArray = [];
		for (var i = 0; i < resultParsed.length; i++) {
			var result = (resultParsed[i].fieldAPIName);
			resultArray.push(result);
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
