package com.team19.airbnb.controller;

import com.team19.airbnb.ResponseBody;
import com.team19.airbnb.dto.RoomDetailResponseDTO;
import com.team19.airbnb.dto.RoomPriceRequestDTO;
import com.team19.airbnb.dto.RoomPriceResponseDTO;
import com.team19.airbnb.domain.room.Host;
import com.team19.airbnb.dto.SearchRequestDTO;
import com.team19.airbnb.service.RoomService;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RestController
public class RoomController {

    private final RoomService roomService;

    public RoomController(RoomService roomService) {
        this.roomService = roomService;
    }

    @GetMapping("/rooms/{roomId}")
    public ResponseBody<RoomDetailResponseDTO> detailRoom(@PathVariable Long roomId) {
        return ResponseBody.ok(roomService.showRoom(roomId));
    }

    @GetMapping("/rooms/{roomId}/price")
    public RoomPriceResponseDTO detailRoomPopup(@ModelAttribute RoomPriceRequestDTO roomPriceRequestDTO, @PathVariable Long roomId) {
        return roomService.showEstimate(roomPriceRequestDTO, roomId);
    }

    @GetMapping("/rooms/price")
    public List<BigDecimal> searchPriceRange(@RequestParam Double latitude, @RequestParam Double longitude ) {
        return roomService.searchPriceRange(latitude, longitude);
    }

    @GetMapping("/rooms")
    public List<RoomDetailResponseDTO> searchRoomsByCondition(@ModelAttribute SearchRequestDTO searchRequestDTO) {
        return roomService.searchRoomsByCondition(searchRequestDTO);
    }
}
