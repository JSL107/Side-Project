package pro.sevenstay.sevenstay.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pro.sevenstay.sevenstay.model.entity.Accommodation;

public interface AccommodationRepository extends JpaRepository<Accommodation, Long> {
    Accommodation findByAccommodationName(String AccommodationName);
}
