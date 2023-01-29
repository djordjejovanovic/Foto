package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the bills database table.
 * 
 */
@Entity
@Table(name="bills")
@NamedQuery(name="Bill.findAll", query="SELECT b FROM Bill b")
public class Bill implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int billId;

	private float price;

	@Column(name="Users_UserId")
	private int userId;

	//bi-directional many-to-one association to Order
	@ManyToOne
	@JoinColumn(name="Orders_OrderId")
	private Order order;

	public Bill() {
	}

	public int getBillId() {
		return this.billId;
	}

	public void setBillId(int billId) {
		this.billId = billId;
	}

	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getUsers_UserId() {
		return this.userId;
	}

	public void setUsers_UserId(int users_UserId) {
		this.userId = users_UserId;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}