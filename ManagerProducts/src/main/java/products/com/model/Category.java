package products.com.model;

public class Category {
    private int id ;
    private String name_category ;

    public Category(){} ;

    public Category(int id, String name_category) {
        this.id = id;
        this.name_category = name_category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameCategory() {
        return name_category;
    }

    public void setNameCategory(String name_category) {
        this.name_category = name_category;
    }
}
