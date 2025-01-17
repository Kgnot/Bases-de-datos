package udistrital.module.bd.entities;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "tipocarpeta")
public class TipoCarpeta {

    @Id
    @Column(name = "idtipocarpeta",length = 3)
    private String idTipoCarpeta;
    @Column(name = "desctipocarpeta",length = 30)
    private String descTipoCarpeta;

    //Demas relaciones 

    @OneToMany(mappedBy = "tipoCarpeta")
    private List<Mensaje> mensajes;
    
}
