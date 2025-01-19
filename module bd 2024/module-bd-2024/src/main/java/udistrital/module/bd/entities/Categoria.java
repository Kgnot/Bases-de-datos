package udistrital.module.bd.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Table(name = "categoria")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Categoria {

    @Id
    @Column(name = "idcategoria", length = 3)
    private String idCategoria;
    @Column(name = "desccategoria",length = 30)
    private String descCategoria;

    @OneToMany(mappedBy = "categoria")
    @JsonBackReference
    public List<Mensaje> mensajes;

}
