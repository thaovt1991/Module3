package model;

public class Transfer {
    private int idTransfer  ;
    private int idSender ;
    private String name_Sender ;
    private int idRecipient ;
    private String name_Recipient ;
    private long transferAmount ;
    private int fees ;

    public Transfer(){} ;

    public Transfer(int idTransfer, int idSender, String name_Sender, int idRecipient, String name_Recipient, long transferAmount, int fees) {
        this.idTransfer = idTransfer;
        this.idSender = idSender;
        this.name_Sender = name_Sender;
        this.idRecipient = idRecipient;
        this.name_Recipient = name_Recipient;
        this.transferAmount = transferAmount;
        this.fees = fees;
    }

    public String getName_Sender() {
        return name_Sender;
    }

    public void setName_Sender(String name_Sender) {
        this.name_Sender = name_Sender;
    }

    public String getName_Recipient() {
        return name_Recipient;
    }

    public void setName_Recipient(String name_Recipient) {
        this.name_Recipient = name_Recipient;
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
