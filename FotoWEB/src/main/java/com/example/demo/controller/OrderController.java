package com.example.demo.controller;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.OrderReportModel;
import com.example.demo.OrderWithPhoto;
import com.example.demo.repository.BillsRepository;
import com.example.demo.repository.OrderRepository;
import com.example.demo.repository.PhotoRepository;
import com.example.demo.repository.PricelistRepository;
import com.example.demo.repository.UserRepository;

import model.Bill;
import model.Order;
import model.Photo;
import model.Pricelist;
import model.User;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

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
	
	@Autowired
	UserRepository ur;
	
	public List<OrderWithPhoto> getOrders(User user) {
		
		List<Order> orders = null;
		
		if(user.getRole().getRoleId() == 1) {
			orders = or.findAll();
		}
		else {
			orders = or.findAllByUserId(user.getUserId());
		}
		
		List<OrderWithPhoto> owpl = new ArrayList<OrderWithPhoto>();
		if(orders != null && orders.size() > 0) {
			for (Order o : orders) {
				OrderWithPhoto owp = new OrderWithPhoto();
				owp.setOrderId(o.getOrderId());
				owp.setUserId(o.userId());
				owp.setDone(o.getDone());
				owp.setCreationDate(o.getCreationDate());
				owp.setName(o.getName());
				
//				Photo photo = photorepo.findByOrderId(o.getOrderId());
//				
//				owp.setPhotoName(photo.getName());
				
				owpl.add(owp);
			}
		}
		
		return owpl;
	}
	
	@RequestMapping(value = "createOrder", method = RequestMethod.POST)
	public String createOrder(String ordername, String format, int quantity, @RequestParam MultipartFile slika, HttpServletRequest request, Model m) {
		
		if (slika == null) {
			request.setAttribute("photoFaild", "Failure.");
			return "orders/createorder";
		}
		
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

		String photoName = slika.getOriginalFilename();
		photo.setName(photoName);
		
		String filePath;
		try {
			filePath = System.getProperty("user.dir");
			filePath += "/src/main/webapp/photos";
			System.out.println(filePath);
			File imageFile = new File(filePath, photoName);

			slika.transferTo(imageFile);
			photo.setPhoto(Files.readAllBytes(imageFile.toPath()));
			
			photo = photorepo.save(photo);
			
		} catch (Exception e) {
			e.printStackTrace();
			or.deleteById(order.getOrderId());
			request.setAttribute("photoFaild", "Failure.");
			System.out.println("exception");
			return "orders/createorder";
		}
		
		request.setAttribute("saveOrderSucc", "Successfuly ordered photo.");
		
		Bill bill = new Bill();
		int price = quantity * pl.getPricePerPiece();
		bill.setPrice(price);
		bill.setUsers_UserId(user.getUserId());
		bill.setOrder(order);
		bill = billrepo.save(bill);
		
		List<OrderWithPhoto> orders = getOrders(user);
		if(orders != null && !orders.isEmpty()) {
			request.getSession().setAttribute("orders", orders);
			m.addAttribute("orders", orders);
		}
	
		return "orders/myOrders";
	}
	
	@RequestMapping(value = "myOrders", method = RequestMethod.GET)
	public String myOrders(HttpServletRequest request, Model m) {
		
		User user = (User) request.getSession().getAttribute("user");
		
		List<Order> orders = or.findAllByUserId(user.getUserId());
		
		List<OrderWithPhoto> owpl = new ArrayList<OrderWithPhoto>();
		if(orders != null && orders.size() > 0) {
			for (Order o : orders) {
				OrderWithPhoto owp = new OrderWithPhoto();
				owp.setOrderId(o.getOrderId());
				owp.setUserId(o.userId());
				owp.setDone(o.getDone());
				owp.setCreationDate(o.getCreationDate());
				owp.setName(o.getName());
				
				List<Photo> photo = o.getPhotos();
				if(photo != null && photo.size() == 1) {
					for (Photo p : photo) {
						owp.setPhotoName(p.getName());
					}
				}
				owpl.add(owp);
			}
		}
		
		if(owpl != null && !owpl.isEmpty()) {
			request.getSession().setAttribute("orders", owpl);
			m.addAttribute("orders", owpl);
		}
	
		return "orders/myOrders";
	}
	
	@RequestMapping(value = "allOrders")
	public String allOrders(HttpServletRequest request, Model m) {
		
		List<Order> orders = or.findAll();
		
		List<OrderWithPhoto> owpl = new ArrayList<OrderWithPhoto>();
		if(orders != null && orders.size() > 0) {
			for (Order o : orders) {
				OrderWithPhoto owp = new OrderWithPhoto();
				owp.setOrderId(o.getOrderId());
				owp.setUserId(o.userId());
				owp.setDone(o.getDone());
				owp.setCreationDate(o.getCreationDate());
				owp.setName(o.getName());
				
				List<Photo> photo = o.getPhotos();
				if(photo != null && photo.size() == 1) {
					for (Photo p : photo) {
						owp.setPhotoName(p.getName());
					}
				}
				
				owpl.add(owp);
			}
		}
		
		if(owpl != null && !owpl.isEmpty()) {
			request.getSession().setAttribute("orders", owpl);
			m.addAttribute("orders", owpl);
		}
	
		return "orders/allOrders";
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
	
	public List<OrderReportModel> createReportModel(User user) {
		List<OrderReportModel> reportModelList = new ArrayList<OrderReportModel>();
		
		List<Order> ordersList = or.findAllByUserId(user.getUserId());
		
		for (Order order : ordersList) {
			OrderReportModel orm = new OrderReportModel();
			orm.setCreationDate(order.getCreationDate());
			orm.setOrderName(order.getName());
			
			boolean status = order.getDone();
			if(status)
				orm.setStatus("Done");
			else
				orm.setStatus("In progres.");
			
			orm.setUsername(user.getUsername());
			
			Bill orderBill = billrepo.findByOrder(order);
			if(orderBill != null)
				orm.setPrice((int) orderBill.getPrice());
			
			reportModelList.add(orm);
		}
		
		return reportModelList;
	}
	
	@RequestMapping(value="myOrdersReport", method=RequestMethod.GET)
	public void myOrdersReport(HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		User user = (User) request.getSession().getAttribute("user");
		
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(createReportModel(user));
		InputStream inputStream = this.getClass().getResourceAsStream("/jasperreports/MyOrdersReport.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
		Map<String, Object> params = new HashMap<String, Object>();
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
		inputStream.close();
		
		
		response.setContentType("application/x-download");
		response.addHeader("Content-disposition", "attachment; filename=OrderReports.pdf");
		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint,out);
	}

}
