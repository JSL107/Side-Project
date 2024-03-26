package pro.sevenstay.sevenstay.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pro.sevenstay.sevenstay.model.dto.OrderDTO;
import pro.sevenstay.sevenstay.service.OrderService;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/accommodation")

public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping() // POST: ~/accommodation
    public void insertOrder(@RequestBody OrderDTO orderDTO) {

        orderService.insertOrder(orderDTO);
    }
}