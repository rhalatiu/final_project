package model;

import javax.persistence.*;

@Entity
@Table(name = "products")
public class Products {

    @Id
    @Column(name = "idFruct", unique = true)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idFruct;

    @Column(name = "titlu")
    private String titlu;

    @Column(name = "pret")
    private int pret;

    @Column(name = "cantitate")
    private int cantitate;


    public int getId() {
        return idFruct;
    }

    public void setId(int idFruct) {
        this.idFruct = idFruct;
    }

    public String getTitlu() {
        return titlu;
    }

    public void setTitlu(String titlu) {
        this.titlu = titlu;
    }

    public int getPret() {
        return pret;
    }

    public void setPret(int pret) {
        this.pret = pret;
    }

    public int getCantitate() {
        return cantitate;
    }

    public void setCantitate(int cantitate) {
        this.cantitate = cantitate;
    }
}
