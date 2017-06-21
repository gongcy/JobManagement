package pojo;
// Generated Jun 21, 2017 2:29:16 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Job generated by hbm2java
 */
public class Job  implements java.io.Serializable {


     private String jobNo;
     private String jobName;
     private String jobType;
     private Set recruitments = new HashSet(0);
     private Set toEmploys = new HashSet(0);

    public Job() {
    }

	
    public Job(String jobNo) {
        this.jobNo = jobNo;
    }
    public Job(String jobNo, String jobName, String jobType, Set recruitments, Set toEmploys) {
       this.jobNo = jobNo;
       this.jobName = jobName;
       this.jobType = jobType;
       this.recruitments = recruitments;
       this.toEmploys = toEmploys;
    }
   
    public String getJobNo() {
        return this.jobNo;
    }
    
    public void setJobNo(String jobNo) {
        this.jobNo = jobNo;
    }
    public String getJobName() {
        return this.jobName;
    }
    
    public void setJobName(String jobName) {
        this.jobName = jobName;
    }
    public String getJobType() {
        return this.jobType;
    }
    
    public void setJobType(String jobType) {
        this.jobType = jobType;
    }
    public Set getRecruitments() {
        return this.recruitments;
    }
    
    public void setRecruitments(Set recruitments) {
        this.recruitments = recruitments;
    }
    public Set getToEmploys() {
        return this.toEmploys;
    }
    
    public void setToEmploys(Set toEmploys) {
        this.toEmploys = toEmploys;
    }




}


