package entities;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class User {
    private Integer id;
    private String firstName;
    private String lastName;
    private String emailAddress;
    private String password;
    private String country;
    private String streetAddress;
    private String apartment;
    private String city;

    private String phone;

    private boolean active;
    private Integer roleId;
    private String role;

    public User() {
    }

    public User(String firstName, String lastName, String emailAddress, String password, String country,
                String streetAddress, String apartment, String city, String phone, String role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.emailAddress = emailAddress;
        this.password = password;
        this.country = country;
        this.streetAddress = streetAddress;
        this.apartment = apartment;
        this.city = city;
        this.phone = phone;
        this.role = role;
    }

}
