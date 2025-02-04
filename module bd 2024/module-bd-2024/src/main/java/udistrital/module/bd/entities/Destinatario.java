package udistrital.module.bd.entities;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Destinatario")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Destinatario {
    
    @Id
    @Column(name = "consecdestinatario")
    private int consecDestinatario;

    // Aquí las relaciones
    @ManyToOne
    @JoinColumn(name = "idpais")
    @JsonManagedReference
    private Pais pais;
    @ManyToOne
    @JoinColumn(name = "idtipocopia")
    @JsonManagedReference
    private TipoCopia tipoCopia;
    @ManyToOne
    @JoinColumn(name = "conseccontacto")
    @JsonManagedReference
    private Contacto contacto;
    @ManyToOne
    @JsonManagedReference
    @JoinColumns({
        @JoinColumn(name = "idmensaje"),
        @JoinColumn(name = "usuario")
    })
    private Mensaje mensaje;

}
