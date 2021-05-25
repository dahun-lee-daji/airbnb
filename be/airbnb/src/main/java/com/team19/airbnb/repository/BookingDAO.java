package com.team19.airbnb.repository;

import com.team19.airbnb.domain.Booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Repository
public class BookingDAO {

    private final JdbcTemplate jdbcTemplate;
    private final NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Autowired
    public BookingDAO(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
        namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

//    김영한님 강의 베낌
//    public Booking save(Booking booking) {
//        SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
//        jdbcInsert.withTableName("booking").usingGeneratedKeyColumns("id");
//
//        Map<String, Object> parameters = new HashMap<>();
//        parameters.put("room", booking.getRoom());
//        parameters.put("checkIn", booking.getCheckIn());
//        parameters.put("checkOut", booking.getCheckOut());
//
//        Number key = jdbcInsert.executeAndReturnKey(new MapSqlParameterSource(parameters));
//        booking.setId(key.longValue());
//        return booking;
//
//        baeldug보면 이런식 가능//
//        return jdbcTemplate.update("insert into booking (room, check_in,check_out) values (booking.  ... "
//    }

    public Optional<Booking> findById(Long id) {
        List<Booking> result = jdbcTemplate.query("select * from booking where id = ?",
                bookingRowMapper(), id);
        return result.stream().findAny();
    }

    private RowMapper<Booking> bookingRowMapper() {
        return (rs, rowNum) -> {
           return Booking.create(rs.getLong("id"), rs.getLong("user"),
                    rs.getObject("check_in", LocalDate.class), rs.getObject("check_out", LocalDate.class));
        };
    }

    public void bookReservation(Booking booking, Long userId) {
        String query = "INSERT INTO booking (check_in, check_out, guest, total_price, user, room) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(query, booking.getCheckIn(), booking.getCheckOut(), booking.getGuest(), booking.getTotalPrice(), userId, booking.getRoom());
        //user.book(booking);

    }
}
