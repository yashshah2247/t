public class newtesttask {
    public List<Contact> contacts {get;set;}
    private String soql {get;set;}
    // public Integer total{get;set;}
    // public Integer page{get;set;}
    // public Integer size = 0;
    // public Integer li = 10;
    // public String sortDir {
    //   get  { if (sortDir == null) {  sortDir = 'asc'; } return sortDir;  }
    //   set;
    // }
    // public String sortField {
    //     get  { if (sortField == null) {sortField = 'lastName'; } return sortField;  }
    //     set;
    // }
    // public String debugSoql {
    //     get { return soql + ' order by ' + sortField + ' ' + sortDir; }
    //     set;
    // }
    public newtesttask() {
        soql = 'select firstname, lastname from contact where firstname != null';
        // total = [SELECT count() FROM Contact ] ;
        contacts = Database.query(soql);
        // page = 1;
        // runQuery();
    }
    // public void toggleSort() {
    //   sortDir = sortDir.equals('asc') ? 'desc' : 'asc';
    //   runQuery();
    // }
    // public void runQuery() {
    //   try {
    //       contacts = Database.query(soql + ' order by ' + sortField + ' ' + sortDir);
    //   } catch (Exception e) {
    //   }
    // }
    public PageReference runSearch() {
      String firstName = Apexpages.currentPage().getParameters().get('firstname');   
      soql = 'select firstname, lastname from contact where firstname != null';
      if (!firstName.equals(''))
        soql += ' and firstname LIKE \''+String.escapeSingleQuotes(firstName)+'%\'';
        contacts = Database.query(soql);
    //   runQuery();
      return null;
    }
//     public PageReference next(){
//       size += li ;
//       page =size+1;
//       return null;
//   }
  
//   public PageReference prv(){
//       size -= li ;
//       page = size+1;
//       return null;
//   }
  
//   public PageReference fst(){S
//       size = 0;
//       page = 1;
//       return null;
//   }
  
//   public PageReference end(){
//       size = total - math.mod(total,li);
//       page = size+1;
//       return null;
//   }    
}
