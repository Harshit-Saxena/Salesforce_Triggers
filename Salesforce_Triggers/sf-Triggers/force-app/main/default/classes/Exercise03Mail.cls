//* 3. Once an Account is inserted an email should go to the System Admin user with specified text below. 
    //*An account has been created and the name is “Account Name”.

public with sharing class Exercise03Mail {
    public static void Exercise03(List<Account> accLst){
        if(accLst.size()>0){
            List<Messaging.SingleEmailMessage> mailLst = new List<Messaging.SingleEmailMessage>();
            // Query to get the email from the profile name of system admin
            User usrObj = [SELECT Id,Email,Profile.Name FROM User WHERE Profile.Name='System Administrator'];
            for(Account acc : accLst){
                // check if the email of the user is not null
                if (usrObj.Email != null) {
                    Messaging.SingleEmailMessage mailObj = new Messaging.SingleEmailMessage();
                    mailObj.setSenderDisplayName('Salesforce Mail Trigger');
                    mailObj.setUseSignature(false);
                    mailObj.setBccSender(false);
                    mailObj.setSaveAsActivity(false);
                    mailObj.toAddresses = new String[] {usrObj.Email};
                    mailObj.setSubject('New Account was created');
                    String body = 'Dear System Administrator, <br/>';
                    body += 'An Account has been created and the name is '+acc.Name+'.';
                    mailObj.setHtmlBody(body);
                    mailLst.add(mailObj);
                }
            }
            if(mailLst.size() > 0){
                // Messaging.sendEmail(mailLst) " is used to send the list of mail
                Messaging.SendEmailResult[] res = Messaging.sendEmail(mailLst);
                if(res[0].success){
                    system.debug('The email was sent successfully');
                }else{
                    System.debug('The email was failed'+res[0].errors[0].message);
                }
            }
        }
    }
}
