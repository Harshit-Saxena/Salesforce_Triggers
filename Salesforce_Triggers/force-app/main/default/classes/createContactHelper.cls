public class createContactHelper {
	public static void createContact(Map<Id,Account> accMap){
    if(!accMap.isEmpty()){
        List<contact> conList = new List<contact>();
        List<Account> accList = [select id, name from account where Id IN :accMap.keySet()];
        for(Account acc : accList){
            acc.Only_Default_Contact__c = true;
            Contact cc = new contact();
            for(contact con : conList){
                for(integer i=0; i==5 ; i++){
                    con.LastName = 'Default01Trigger'+i;
                    con.accountId = acc.Id;
                    con.Phone = '123000'+i;
                    conList.add(con);
                    }
            }
        }
        UPDATE accList;
        if(conList.size() > 0){
        INSERT conList;
        }
	}
}
}