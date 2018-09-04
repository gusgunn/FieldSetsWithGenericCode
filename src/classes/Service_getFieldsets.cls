public class Service_getFieldsets {
  
  /**************************
   * @ gusgunn
   * 9/4/18  -created simple method to get field set api names
   * also see slight change to getFieldsetSuccess in helper
   */

   @AuraEnabled 
    public static List<String> getFieldSetMember(String objectName , String fieldSetName){
        System.debug('FieldsetName--> ' + fieldSetName);
        System.debug('objectName--> ' + objectName);
        List<String> fieldlNameList = new List<String>();
        Schema.SObjectType sObj = Schema.getGlobalDescribe().get(objectName);
        
        for(Schema.FieldSetMember fieldMember : sObj.getDescribe().fieldSets.getMap().get(fieldSetName).getFields()){
       		   fieldlNameList.add(fieldMember.getFieldPath());
            
               }
            System.debug('#### fieldlNameList '+fieldlNameList);
            return fieldlNameList;
        }
        
} 
  
   
