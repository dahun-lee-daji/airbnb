package com.team19.airbnb.dto;

import com.team19.airbnb.domain.Booking.Booking;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;

import java.math.BigDecimal;
import java.time.LocalDate;

public class SearchRequestDTO {

    @Nullable
    private String address;

    private Double[] coordinate;

    @Nullable
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate checkIn;

    @Nullable
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate checkOut;

    @Nullable
    private BigDecimal minPrice;

    @Nullable
    private BigDecimal maxPrice;

    @Nullable
    private Integer guest; //adult + child , toddler x

    public SearchRequestDTO(String address, Double[] coordinate,
                            LocalDate checkIn, LocalDate checkOut,
                            BigDecimal minPrice, BigDecimal maxPrice,
                            int guest) {
        this.address = address;
        this.coordinate = coordinate;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
        this.guest = guest;
    }

    public String getAddress() {
        return address;
    }

    public Double[] getCoordinate() {
        return coordinate;
    }

    public LocalDate getCheckIn() {
        return checkIn;
    }

    public LocalDate getCheckOut() {
        return checkOut;
    }

    public BigDecimal getMinPrice() {
        return minPrice;
    }

    public BigDecimal getMaxPrice() {
        return maxPrice;
    }

    public Integer getGuest() {
        return guest;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCheckIn(LocalDate checkIn) {
        this.checkIn = checkIn;
    }

    public void setCheckOut(LocalDate checkOut) {
        this.checkOut = checkOut;
    }

    public void setMinPrice(BigDecimal minPrice) {
        this.minPrice = minPrice;
    }

    public void setMaxPrice(BigDecimal maxPrice) {
        this.maxPrice = maxPrice;
    }

    public void setGuest(Integer guest) {
        this.guest = guest;
    }

    public Booking toBooking() {
        return new Booking.Builder()
                .checkIn(checkIn)
                .checkOut(checkOut)
                .guest(guest)
                .build();
    }

}
