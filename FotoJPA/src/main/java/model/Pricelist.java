package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the pricelist database table.
 * 
 */
@Entity
@NamedQuery(name="Pricelist.findAll", query="SELECT p FROM Pricelist p")
public class Pricelist implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int formatId;

	private String formatSize;

	private int pricePerPiece;

	//bi-directional many-to-one association to Photo
	@OneToMany(mappedBy="pricelist")
	private List<Photo> photos;

	public Pricelist() {
	}

	public int getFormatId() {
		return this.formatId;
	}

	public void setFormatId(int formatId) {
		this.formatId = formatId;
	}

	public String getFormatSize() {
		return this.formatSize;
	}

	public void setFormatSize(String formatSize) {
		this.formatSize = formatSize;
	}

	public int getPricePerPiece() {
		return this.pricePerPiece;
	}

	public void setPricePerPiece(int pricePerPiece) {
		this.pricePerPiece = pricePerPiece;
	}

	public List<Photo> getPhotos() {
		return this.photos;
	}

	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}

	public Photo addPhoto(Photo photo) {
		getPhotos().add(photo);
		photo.setPricelist(this);

		return photo;
	}

	public Photo removePhoto(Photo photo) {
		getPhotos().remove(photo);
		photo.setPricelist(null);

		return photo;
	}

}