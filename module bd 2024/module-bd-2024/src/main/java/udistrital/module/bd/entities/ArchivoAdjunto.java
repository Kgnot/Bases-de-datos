package udistrital.module.bd.entities;

import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.ManyToOne;

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
    //ManyToOne
    @ManyToOne
    @JoinColumn(name = "idtipoarchivo")
    private TipoArchivo TipoArchivo;
    @ManyToOne
    @JsonManagedReference
    @JoinColumns({
        @JoinColumn(name = "usuario", referencedColumnName = "idUsuario"),
        @JoinColumn(name = "idmensaje",referencedColumnName = "idMensaje")
    })
    private Mensaje mensaje;

    
}
