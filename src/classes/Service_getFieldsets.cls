public class Service_getFieldsets {
     
  
    /* NOTE I use this class in a different way that AMIT, and I use my own client side code.
     * @Created Date:- 21th APRIL 2018
     * @Author : AMIT SINGH
     * @Name : getFieldSetMember
     * @ReturnType : String
     * @param : String objectName , String fieldSetName
     * @Description : List all the Fields that are added into the FielsSet
<<<<<<< HEAD
=======
     * http://www.sfdcpanther.com/how-to-use-field-set-in-lightning-component/
>>>>>>> 23a9943ee04a3a5b43d0edb7abc6deadd442ccc4
     */
  
    @AuraEnabled 
    public static String getFieldSetMember(String objectName , String fieldSetName){
        System.debug('FieldsetName--> ' + fieldSetName);
        System.debug('objectName--> ' + objectName);
        List<FieldSetMemberWrapperClass> wrapperList = new List<FieldSetMemberWrapperClass>();
        Schema.SObjectType sObj = Schema.getGlobalDescribe().get(objectName);
        
        for(Schema.FieldSetMember fieldMember : sObj.getDescribe().fieldSets.getMap().get(fieldSetName).getFields()){
            FieldSetMemberWrapperClass wrapper = new FieldSetMemberWrapperClass();
            wrapper.isDBRequired = fieldMember.getDbRequired();
            wrapper.isRequired = fieldMember.getRequired();
            wrapper.fieldType = String.valueOf(fieldMember.getType());
            wrapper.fieldLabel = fieldMember.getLabel();
            wrapper.fieldAPIName = fieldMember.getFieldPath();
            if(String.valueOf(fieldMember.getType()) == 'PICKLIST' || 
               String.valueOf(fieldMember.getType()) == 'MULTIPICKLIST'){
                   wrapper.pickListValues = sObj.getDescribe().fields.getMap().get(fieldMember.getFieldPath())
                       .getDescribe().getPicklistValues();
               }
            wrapperList.add(wrapper);
        }
        //System.debug('#### wrapperList '+wrapperList);
        
        return JSON.serialize(wrapperList);
    }
  
   
    
    /*
* @Description : Wrapper class contains the information about all the fields of a FieldSet
*/ 
    public class FieldSetMemberWrapperClass{
        
        @AuraEnabled
        public Boolean isDBRequired                      { get; set; }
        @AuraEnabled
        public Boolean isRequired                        { get; set; }
        @AuraEnabled
        public String fieldType                          { get; set; }
        @AuraEnabled
        public String fieldLabel                         { get; set; }
        @AuraEnabled
        public String fieldAPIName                       { get; set; }
        @AuraEnabled 
        public List<Schema.PicklistEntry> pickListValues { get; set; }
        
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> 23a9943ee04a3a5b43d0edb7abc6deadd442ccc4
