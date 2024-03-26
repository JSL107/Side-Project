package pro.sevenstay.sevenstay.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pro.sevenstay.sevenstay.model.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {

}