package pro.sevenstay.sevenstay.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pro.sevenstay.sevenstay.model.dto.AccommodationDTO;
import pro.sevenstay.sevenstay.service.AccommodationService;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping(path = "/accommodation") // /accommodation/get
public class AccommodationController {

    private final AccommodationService accommodationService;

    public AccommodationController(AccommodationService accommodationService) {
        this.accommodationService = accommodationService;
    }

    @GetMapping("/get")
    public List<AccommodationDTO> findAllAccommo() {
        return accommodationService.findAllAccommo();
    }

}
