public class leadPrefixDrCls {
    public static void leadPrefixDr(List<Lead> leadList){
        system.debug('LeadList::>>'+ leadList);
        if(!leadList.IsEmpty()){
            Boolean isDrAlreadyDr = false;
            for(Lead lc : leadList){
                if(lc.FirstName != null && lc.FirstName != 'undefined'){
                    Integer DrIndex = lc.FirstName.indexOf('Dr');
                    if( DrIndex == -1){
                    lc.FirstName = 'Dr '+lc.FirstName;
                    }
                    else if(DrIndex != -1){
                        return;
                    }
                }else{
                    lc.addError('First Name cannot be blank');
                }
            }
        }
        else{
            system.debug('Empty LeadList::>>'+ leadList);
        }
    }
}