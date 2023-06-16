//? When Account Phone is updated then all related contact phone shoud be updated as well. 
public with sharing class UpdateChildByParentHandler {
    public UpdateChildByParentHandler() { }
    public static void ContactUpdate(List<Account> accRec){
        Map<Id,Account> accRecMap = new Map<Id,Account>();
        List<Contact> udpatedContact = new List<Contact>();
        if(!accRec.isEmpty()){
            for(Account acc : accRec){
                Account oldAcc = (Account) trigger.oldMap.get(acc.Id);
                if (oldAcc != null && oldAcc.Phone != null && !oldAcc.Phone.equals(acc.Phone)) {
                    accRecMap.put(acc.Id, acc);
                }
            }
            List<Contact> contactList = [select id, AccountId, Phone from contact where AccountId In : accRecMap.keyset()];
            if(!contactList.isEmpty()){
                for(Contact contact : contactList){
                    contact.Phone = accRecMap.get(contact.AccountId).Phone;
                    udpatedContact.add(contact);
                }
                if(!udpatedContact.isEmpty()){
                    Update udpatedContact;
                }
            }
        }
    }
}