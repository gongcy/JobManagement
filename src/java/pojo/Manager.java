package pojo;
// Generated Jun 17, 2017 1:34:53 PM by Hibernate Tools 4.3.1



/**
 * Manager generated by hbm2java
 */
public class Manager  implements java.io.Serializable {


     private String managerNo;
     private String password;

    public Manager() {
    }

	
    public Manager(String managerNo) {
        this.managerNo = managerNo;
    }
    public Manager(String managerNo, String password) {
       this.managerNo = managerNo;
       this.password = password;
    }
   
    public String getManagerNo() {
        return this.managerNo;
    }
    
    public void setManagerNo(String managerNo) {
        this.managerNo = managerNo;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }




}


