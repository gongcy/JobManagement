package pojo;
// Generated Jun 21, 2017 2:29:16 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Student generated by hbm2java
 */
public class Student  implements java.io.Serializable {


     private String studentNo;
     private String studentName;
     private String password;
     private Character gender;
     private Integer resumeAmount;
     private String status;
     private Character active;
     private Set resumes = new HashSet(0);
     private Set toEmploys = new HashSet(0);

    public Student() {
    }

	
    public Student(String studentNo) {
        this.studentNo = studentNo;
    }
    public Student(String studentNo, String studentName, String password, Character gender, Integer resumeAmount, String status, Character active, Set resumes, Set toEmploys) {
       this.studentNo = studentNo;
       this.studentName = studentName;
       this.password = password;
       this.gender = gender;
       this.resumeAmount = resumeAmount;
       this.status = status;
       this.active = active;
       this.resumes = resumes;
       this.toEmploys = toEmploys;
    }
   
    public String getStudentNo() {
        return this.studentNo;
    }
    
    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }
    public String getStudentName() {
        return this.studentName;
    }
    
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Character getGender() {
        return this.gender;
    }
    
    public void setGender(Character gender) {
        this.gender = gender;
    }
    public Integer getResumeAmount() {
        return this.resumeAmount;
    }
    
    public void setResumeAmount(Integer resumeAmount) {
        this.resumeAmount = resumeAmount;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public Character getActive() {
        return this.active;
    }
    
    public void setActive(Character active) {
        this.active = active;
    }
    public Set getResumes() {
        return this.resumes;
    }
    
    public void setResumes(Set resumes) {
        this.resumes = resumes;
    }
    public Set getToEmploys() {
        return this.toEmploys;
    }
    
    public void setToEmploys(Set toEmploys) {
        this.toEmploys = toEmploys;
    }




}


