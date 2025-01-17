package udistrital.module.bd.entities;

import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
@Table(name="ArchivoAdjunto")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ArchivoAdjunto {

    @Id
    @Column(name = "consecarchivo")
    private int consecArchivo;
    @Column(name = "nomarchivo", length = 30)
    private String nomArchivo;

    // Aquí van las relaciones

    
}
