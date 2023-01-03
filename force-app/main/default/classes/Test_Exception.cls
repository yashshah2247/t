public class Test_Exception {
    public void m1(){
        List<Account> listacc=[select id,name,rating from account];
        try{
            for(Account ac:listacc){
                if(ac.rating.equals('Hot')){

                }
            }
        }catch(Exception e){
            System.debug('Eccc ' +e);
        }
    }

}
