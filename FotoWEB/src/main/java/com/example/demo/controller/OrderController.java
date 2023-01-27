package com.example.demo.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.repository.BillsRepository;
import com.example.demo.repository.OrderRepository;
import com.example.demo.repository.PhotoRepository;
import com.example.demo.repository.PricelistRepository;

import model.Bill;
import model.Order;
import model.Photo;
import model.Pricelist;
import model.User;

@Controller
@RequestMapping(value = "ordercontroller")
public class OrderController {
	
	@Autowired
	OrderRepository or;
	
	@Autowired
	PricelistRepository pr;
	
	@Autowired
	PhotoRepository photorepo;
	
	@Autowired
	BillsRepository billrepo;
	
	public List<Order> getOrders(User user) {
		
		List<Order> orders = null;
		
		if(user.getRole().getRoleId() == 1) {
			orders = or.findAll();
		}
		else {
			orders = or.findAllByUserId(user.getUserId());
		}
		
		return orders;
	}
	
	@RequestMapping(value = "createOrder", method = RequestMethod.POST)
	public String createOrder(String ordername, String format, int quantity, HttpServletRequest request, Model m) {
		
		Order order = new Order();
		
		User user = (User) request.getSession().getAttribute("user");
		order.setUserId(user.getUserId());
		order.setDone(false);
		order.setCreationDate(new Date());
		order.setName(ordername);
		
		order = or.save(order);
		
		Photo photo = new Photo();
		photo.setQuantity(quantity);
		
		int formatid = Integer.valueOf(format);
		Pricelist pl = pr.findByFormatId(formatid);
		pl.setFormatId(formatid);
		
		photo.setPricelist(pl);
		photo.setOrder(order);
		
		photo.setName("Foto1");
		
		photo = photorepo.save(photo);
		request.setAttribute("saveOrderSucc", "Successfuly ordered photo.");
		
		Bill bill = new Bill();
		int price = quantity * pl.getPricePerPiece();
		bill.setPrice(price);
		bill.setUsers_UserId(user.getUserId());
		bill.setOrder(order);
		bill = billrepo.save(bill);
		
		List<Order> orders = getOrders(user);
		if(orders != null && !orders.isEmpty()) {
			request.getSession().setAttribute("orders", orders);
			m.addAttribute("orders", orders);
		}
	
		return "orders/orders";
	}
	
	@RequestMapping(value = "myOrders")
	public String myOrders(HttpServletRequest request, Model m) {
		
		User user = (User) request.getSession().getAttribute("user");

		List<Order> orders = getOrders(user);
		
		if(orders != null && !orders.isEmpty()) {
			request.getSession().setAttribute("orders", orders);
			m.addAttribute("orders", orders);
		}
	
		return "orders/orders";
	}
	
	@RequestMapping(value = "allOrders")
	public String allOrders(HttpServletRequest request, Model m) {
		
		User user = (User) request.getSession().getAttribute("user");

		List<Order> orders = getOrders(user);
		
		if(orders != null && !orders.isEmpty()) {
			request.getSession().setAttribute("orders", orders);
			m.addAttribute("orders", orders);
		}
	
		return "orders/orders";
	}
	
	@RequestMapping(value = "prepareCreateOrder")
	public String prepareCreateOrder(HttpServletRequest request, Model m) {
		
		List<Pricelist> pricelist = null;
		pricelist = pr.findAll();
		
		if(pricelist != null && !pricelist.isEmpty()) {
			request.getSession().setAttribute("pricelist", pricelist);
			m.addAttribute("pricelist", pricelist);
		}
		
		return "orders/createorder";
	}

}
