package udistrital.module.bd.entities;


import java.util.List;

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
@Table(name = "tipoarchivo")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TipoArchivo {
    
    @Id
    @Column(name = "idtipoarchivo",length = 5)
    private String idTipoArchivo;
    @Column(name = "desctipoarchivo",length = 30)
    private String descTipoArhivo;

    //Aqui las demas relaciones 

    //One To many: 
    @OneToMany(mappedBy = "TipoArchivo")
    private List<ArchivoAdjunto> archivosAjuntos;

}
