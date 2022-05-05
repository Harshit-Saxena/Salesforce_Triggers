// ? 2. Write a trigger on the Account when the Account is updated check all opportunities related to the account. Update all Opportunities Stage to close lost if an opportunity created date is greater than 30 days from today and stage not equal to close won.


public with sharing class Exercise02Helper {
    public static void exercise02(list<Account> accIns) {
        Set<Id> accSet = new set<Id>();
        if(accIns != null) {
            for(Account account : accIns){
                accset.add(account.id);
            }
            // calculate date
            DateTime day30 = system.now() - 30 ;
            List< Opportunity> oppUpdated = new List<Opportunity>();
            List<Opportunity> oppList = [SELECT Id, Name,CreatedDate,Description, StageName, Amount FROM Opportunity ];
            for(Opportunity opp : oppList){
                if(opp.CreatedDate < day30 && opp.StageName != 'Close Won'){
                    opp.StageName = 'Closed Lost';
                    opp.CloseDate = system.today();
                    opp.Description = 'Exercise02 Trigger is running succesfully';
                    oppUpdated.add(opp);
                }
            }
            if(oppUpdated.size() > 0){
                system.debug('updated opp' + oppUpdated);
                UPDATE oppUpdated;
            }


        }

    }
}
