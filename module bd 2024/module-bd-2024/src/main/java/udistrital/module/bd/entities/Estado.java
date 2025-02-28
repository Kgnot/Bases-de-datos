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
@Table(name = "Estado")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Estado {
    
    @Id
    @Column(name = "idestado", length = 5)
    private String idEstado;
    @Column(name = "nombreestado", length = 30)
    private String nombreEstado;

    //Aquí las demas relaciones
    @OneToMany(mappedBy = "estado")
    @JsonBackReference
    private List<Usuario> usuarios;

}
