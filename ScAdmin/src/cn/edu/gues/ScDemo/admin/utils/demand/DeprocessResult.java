package cn.edu.gues.ScDemo.admin.utils.demand;

import java.util.List;

public class DeprocessResult {
    //{"d":[{"__type":"TB_DEPROCESS:#WcfService2","FTID":"522401","GDATE":"2018\/8\/26 23:24:11","PID":"a711756f-7172-4416-bea5-4e5c1beb7bf6","PName":null,"PRESULT":"正在处理","PROSSID":"9237c721-cc32-44cd-992b-9787210bef49","Ptel":null,"Punit":null,"STATUS":"1","TXContent":null,"TXID":"103e2009-4c5b-44ad-8da7-460b510fb6d3","TXNAME":null,"uppid":null,"uppname":null}]}
    private List<DeprocessD> d;

    public List<DeprocessD> getD() {
        return d;
    }

    public void setD(List<DeprocessD> d) {
        this.d = d;
    }
}
