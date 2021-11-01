package model;

public class Customers {
    private String name ;
    private String dateOfBirth ;
    private String add ;
    private String image ;

    public Customers(){}

    public Customers(String name, String dateOfBirth, String add, String image) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.add = add;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
