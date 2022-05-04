public with sharing class Exercise01Helper {
    public static void exercise01(List<Account> accIns){
        List<Account> accUpdated = new List<Account>();
        if(accIns != null){
            for(Account account : accIns){
                if(account.BillingStreet != null && account.BillingCity !=null && account.BillingState !=null && account.BillingCountry !=null && account.BillingPostalCode !=null){
                    account.ShippingStreet =  account.BillingStreet;
                    account.ShippingCity =  account.BillingCity;
                    account.ShippingState =  account.BillingState;
                    account.ShippingCountry =  account.BillingCountry;
                    account.ShippingPostalCode = account.BillingPostalCode;
                    account.Description = 'exercise01 is running successfully.';
                    accUpdated.add(account);
                }
                system.debug('Exercise01>>>>>>'+accIns);
            }
        }
    }
}
