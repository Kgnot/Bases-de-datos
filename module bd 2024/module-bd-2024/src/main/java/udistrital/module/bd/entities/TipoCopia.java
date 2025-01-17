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
@Table(name = "tipocopia")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TipoCopia {
    
    @Id
    @Column(name = "idtipocopia",length = 4)
    private String idTipoCopia;
    @Column(name = "desctipocopia",length = 15)
    private String descTipoCopia;

    // Demas relaciones
    @OneToMany(mappedBy = "tipoCopia")
    @JsonBackReference
    private List<Destinatario> destinatario;
}
