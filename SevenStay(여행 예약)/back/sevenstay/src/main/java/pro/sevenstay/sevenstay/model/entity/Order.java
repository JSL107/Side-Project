package pro.sevenstay.sevenstay.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ORDERS")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ORDER_ID")
    private Long id;

    @Column(name = "ORDER_CITY")
    private String city;

    @Column(name = "ORDER_CHECKIN")
    private String checkIn;

    @Column(name = "ORDER_CHECKOUT")
    private String checkOut;

    @Column(name = "ORDER_PEOPLE")
    private String people;

    @Column(name = "Accommodation_name")
    private String accommodationName;

    @ManyToOne
    @JoinColumn(name = "Accommodation_ID")
    private Accommodation accomodation;

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

    public String getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(String checkIn) {
        this.checkIn = checkIn;
    }

    public String getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(String checkOut) {
        this.checkOut = checkOut;
    }

    public String getPeople() {
        return people;
    }

    public void setPeople(String people) {
        this.people = people;
    }

    

    public String getAccommodationName() {
        return accommodationName;
    }

    public void setAccommodationName(String accommodationName) {
        this.accommodationName = accommodationName;
    }

    public Accommodation getAccomodation() {
        return accomodation;
    }

    public void setAccomodation(Accommodation accomodation) {
        this.accomodation = accomodation;
    }



}
