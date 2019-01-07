package cn.edu.gues.ScDemo.admin.utils.Department;

import java.util.Date;

public class DepartmentD {
    private String __type;
    private String FUNO;
    private Date GDATE;
    private String PID;
    private String QUNO;
    private String UNAME;
    private String UNO;

    public String get__type() {
        return __type;
    }

    public void set__type(String __type) {
        this.__type = __type;
    }

    public String getFUNO() {
        return FUNO;
    }

    public void setFUNO(String FUNO) {
        this.FUNO = FUNO;
    }

    public Date getGDATE() {
        return GDATE;
    }

    public void setGDATE(Date GDATE) {
        this.GDATE = GDATE;
    }

    public String getPID() {
        return PID;
    }

    public void setPID(String PID) {
        this.PID = PID;
    }

    public String getQUNO() {
        return QUNO;
    }

    public void setQUNO(String QUNO) {
        this.QUNO = QUNO;
    }

    public String getUNAME() {
        return UNAME;
    }

    public void setUNAME(String UNAME) {
        this.UNAME = UNAME;
    }

    public String getUNO() {
        return UNO;
    }

    public void setUNO(String UNO) {
        this.UNO = UNO;
    }

    @Override
    public String toString() {
        return "DepartmentD{" +
                "__type='" + __type + '\'' +
                ", FUNO='" + FUNO + '\'' +
                ", GDATE=" + GDATE +
                ", PID='" + PID + '\'' +
                ", QUNO='" + QUNO + '\'' +
                ", UNAME='" + UNAME + '\'' +
                ", UNO='" + UNO + '\'' +
                '}';
    }
}
