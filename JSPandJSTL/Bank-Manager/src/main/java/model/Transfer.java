package model;

public class Transfer {
    private int idTransfer  ;
    private int idSender ;
    private int idRecipient ;
    private long transferAmount ;
    private int fees ;

    public Transfer(){} ;

    public Transfer(int idTransfer, int idSender, int idRecipient, long transferAmount, int fees) {
        this.idTransfer = idTransfer;
        this.idSender = idSender;
        this.idRecipient = idRecipient;
        this.transferAmount = transferAmount;
        this.fees = fees;
    }

    public int getIdTransfer() {
        return idTransfer;
    }

    public void setIdTransfer(int idTransfer) {
        this.idTransfer = idTransfer;
    }

    public int getIdSender() {
        return idSender;
    }

    public void setIdSender(int idSender) {
        this.idSender = idSender;
    }

    public int getIdRecipient() {
        return idRecipient;
    }

    public void setIdRecipient(int idRecipient) {
        this.idRecipient = idRecipient;
    }

    public long getTransferAmount() {
        return transferAmount;
    }

    public void setTransferAmount(long transferAmount) {
        this.transferAmount = transferAmount;
    }

    public int getFees() {
        return fees;
    }

    public void setFees(int fees) {
        this.fees = fees;
    }
}
