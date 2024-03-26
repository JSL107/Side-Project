package pro.sevenstay.sevenstay.model.dto;

import pro.sevenstay.sevenstay.model.entity.Accommodation;

public class OrderDTO {
    private String city;
    private String checkIn;
    private String checkOut;
    private String people;
    private String accommodationName;

    private Accommodation accommodation;

    public OrderDTO(String city, String checkIn, String checkOut, String people, String accommodationName) {
        this.city = city;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.people = people;
        this.accommodationName = accommodationName;
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

    public Accommodation getAccommodation() {
        return accommodation;
    }

    public void setAccommodation(Accommodation accommodation) {
        this.accommodation = accommodation;
    }

    @Override
    public String toString() {
        return "OrderDTO [accommodation=" + accommodation + ", accommodationName=" + accommodationName + ", checkIn="
                + checkIn + ", checkOut=" + checkOut + ", city=" + city + ", people=" + people + "]";
    }

    


}