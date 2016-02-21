package hello;

import javax.persistence.*;

@Entity
public class Person {

    public static final String TABLENAME = "person";
    @TableGenerator(
            name=TABLENAME,
            table="table_sequences",
            pkColumnName="table_name",
            valueColumnName="current_value",
            pkColumnValue=TABLENAME,
            allocationSize=1)
    @Id
    @GeneratedValue(strategy=GenerationType.TABLE, generator=TABLENAME)
    private long id;

    @Column(name="first_name", nullable=false)
    private String firstName;
    @Column(name="last_name", nullable=true)
    private String lastName;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
}