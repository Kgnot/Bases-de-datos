package udistrital.module.bd.entities;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "tipocarpeta")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TipoCarpeta {

    @Id
    @Column(name = "idtipocarpeta",length = 3)
    private String idTipoCarpeta;
    @Column(name = "desctipocarpeta",length = 30, nullable = false)
    private String descTipoCarpeta;

    //Demas relaciones 

    @OneToMany(mappedBy = "tipoCarpeta")
    @JsonBackReference
    private List<Mensaje> mensajes;
    
}
