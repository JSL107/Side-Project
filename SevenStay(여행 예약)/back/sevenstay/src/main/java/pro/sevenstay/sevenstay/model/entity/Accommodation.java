package pro.sevenstay.sevenstay.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Accommodation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Accommodation_ID")
    private Long id;
    @Column(name = "Accommodation_city")
    private String city;
    @Column(name = "Accommodation_Name")
    private String accommodationName;
    @Column(name = "Accommodation_address")
    private String address;
    @Column(name = "Accommodation_phone_number")
    private String phoneNumber;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAccommodationName() {
        return accommodationName;
    }

    public void setAccommodationName(String accommodationName) {
        this.accommodationName = accommodationName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "Accomodation [accommodationName=" + accommodationName + ", address=" + address + ", city=" + city
                + ", id=" + id + ", phoneNumber=" + phoneNumber + "]";
    }

}
