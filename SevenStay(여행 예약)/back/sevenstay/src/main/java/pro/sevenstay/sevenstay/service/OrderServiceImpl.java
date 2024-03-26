package pro.sevenstay.sevenstay.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pro.sevenstay.sevenstay.model.dto.OrderDTO;
import pro.sevenstay.sevenstay.model.entity.Accommodation;
import pro.sevenstay.sevenstay.model.entity.Order;
import pro.sevenstay.sevenstay.model.repository.AccommodationRepository;
import pro.sevenstay.sevenstay.model.repository.OrderRepository;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    AccommodationRepository accommodationRepository;
    @Override
    public void insertOrder(OrderDTO orderDTO) {

        Accommodation accommodation = accommodationRepository.findByAccommodationName(orderDTO.getAccommodationName());
        System.out.println("OrderDTO는 null ?" + orderDTO);
        System.out.println("accmmodation은 null ? : "+accommodation);

        // Order 엔티티 생성
        Order order = new Order();
        order.setCity(orderDTO.getCity());
        order.setCheckIn(orderDTO.getCheckIn());
        order.setCheckOut(orderDTO.getCheckOut());
        order.setPeople(orderDTO.getPeople());

        // 연관관계 설정(맵핑)
        order.setAccomodation(accommodation);

        //저장
        orderRepository.save(order);
    }
   
}