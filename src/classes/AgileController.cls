public with sharing class AgileController {
public List<AGP_Release__c> releaseList{get;set;}
    public List<releasewrap> releaseListdisplay{get;set;}
   public string ChkMapKey{get;set;}
    public Boolean isAllSelected{get;set;}
    public AgileController(){
       releaseListdisplay = new List<releasewrap>();
        if(Schema.sObjectType.AGP_Release__c.fields.name.isAccessible()&&
           Schema.sObjectType.AGP_Release__c.fields.Id.isAccessible()&&
           Schema.sObjectType.AGP_Release__c.fields.Actual_Release_Date__c.isAccessible())
        releaseList = [SELECT Id,Name, Actual_Release_Date__c FROM AGP_Release__c limit 4 ];
        else{
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Insufficient Access'));
            return;
        }
        For(AGP_Release__c u : releaseList ){ 
            releaseWrap r1=new releaseWrap(u);
                releaseListdisplay.add(r1);
           
             }
        }
    public class releaseWrap{
        public AGP_Release__c rel{get;set;}
        public Boolean isSelected{get;set;}
        public releaseWrap(AGP_Release__c r){
            this.rel=r;
            isSelected=false;
        }
    }
    
}