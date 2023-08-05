global class BatchExample implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
          //? This is starting of the batch job
        //? Here we'll collect records or object to be passes to next method
        return Database.getQueryLocator([SELECT Id, Name From Account WHERE Name LIKE '%test%']);
    }
     
    global void execute(Database.BatchableContext BC, List<Account> accList) {
        //? This is where all the logic takes place and everhing happenens
        for(Account acc : accList){
            acc.Name = acc.Name+' Batch';
        }
        try{
            UPDATE accList;
        }catch(Exception e){
            System.debug(e);
        }
    }   
   global void finish(Database.BatchableContext BC) {
        //? This is where we're doing all the post-processing operations'
        List<Messaging.SingleEmailMessage> mailLst = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mailObj = new Messaging.SingleEmailMessage();
        mailObj.setSenderDisplayName('Mail From Batch Class');
        mailObj.setBccSender(false);
        mailObj.toAddresses = new String [] {'Testingbatch@yopmail.com'};
        mailObj.setSubject('This is the mail form batch job');
        String body = 'Hello person, this is the sample template to send mail from batch apex job';
        mailObj.setHtmlBody(body);
        mailLst.add(mailObj);
        if(mailLst.size() > 0){
            Messaging.SendEmailResult[] res = Messaging.sendEmail(mailLst);
           if(res[0].success){
                System.debug('The mail was successfully send by batch apex job');
            }else{
                System.debug('The mail was a Failure');
            } 
        }
        }
    }
