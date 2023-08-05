//* 3. Once an Account is inserted an email should go to the System Admin user with specified text below. 
    //*An account has been created and the name is “Account Name”.

Trigger Exercise03Trigger on Account (After Insert) {
    if(Trigger.IsAfter){
        if(Trigger.IsInsert){
            Exercise03Mail.Exercise03(Trigger.new);
        }
    }
}