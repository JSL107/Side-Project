package pro.sevenstay.sevenstay.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pro.sevenstay.sevenstay.model.dto.AccommodationDTO;
import pro.sevenstay.sevenstay.model.entity.Accommodation;
import pro.sevenstay.sevenstay.model.repository.AccommodationRepository;

@Service
public class AccommodationServiceImpl implements AccommodationService{
    
    @Autowired
    private AccommodationRepository accommodationRepository;
    
    @Override
    public List<AccommodationDTO> findAllAccommo(){
        List<Accommodation> list = accommodationRepository.findAll();
        
        List<AccommodationDTO> result = list.stream().map(r -> new AccommodationDTO(r)).collect(Collectors.toList());
        return result;
    }


}
