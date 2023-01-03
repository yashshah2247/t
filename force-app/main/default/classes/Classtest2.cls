public class Classtest2 {
    public void contactAccountList2(){
        map<Id,account>mAcc=new Map<Id,account>([select id,name,(select id,name,phone from contacts) from account]);
        map<Id,List<Contact>> mapObj = new Map<Id,list<contact>>();
        for(Id idval:mAcc.keyset()){
        System.debug(idval+'=======>'+mAcc.get(idval).contacts);
        mapObj.put(idval, mAcc.get(idval).contacts);
        
    }
    System.debug('mapObj======='+mapObj);
    }

}