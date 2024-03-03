package services;

import daos.impl.OrderDetailDao;
import dtos.OrderDetailDTO;
import dtos.PlantDTO;
import entities.OrderDetail;

import java.util.List;
import java.util.Vector;

public class OrderDetailService {

    private OrderDetailDao orderDetailDao;
    private PlantService plantService;
    private static OrderDetailService instance;

    private OrderDetailService() {
        orderDetailDao = OrderDetailDao.getInstance();
        plantService = PlantService.getInstance();
    }

    public static OrderDetailService getInstance() {
        if (instance == null) {
            instance = new OrderDetailService();
        }
        return instance;
    }

    public List<OrderDetailDTO> getOrderDetailsByOrderId(Integer orderId) {

        List<OrderDetail> orderDetails = orderDetailDao.getOrderDetailsByOrderId(orderId);
        List<OrderDetailDTO> orderDetailDTOs = new Vector<>();

        OrderDetailDTO orderDetailDTO;
        for (OrderDetail orderDetail : orderDetails) {
            PlantDTO plant = plantService.getPlantById(orderDetail.getProductId());


            orderDetailDTO = new OrderDetailDTO(orderDetail.getId(), orderDetail.getProductId(),
                    plant.getTitle(), plant.getUnitPrice(), orderDetail.getQuantity(),
                    orderDetail.getSubtotal(), orderDetail.getOrderId());

            orderDetailDTOs.add(orderDetailDTO);
        }
        return orderDetailDTOs;
    }
}
