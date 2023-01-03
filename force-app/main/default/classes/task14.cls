public class task14 {
    List<Account> rec = new List<Account>();
    public static void testdelete(List<Account> acc) {
        List<Account> rec = new List<Account>();
        for (Account ac : acc){
            rec = [SELECT Id, Name FROM Account WHERE Name = :ac.Name];
    	}
    	if (rec.size()>0){
    		delete rec;
            System.debug('delete suc....');
    	}

    }
}
