package udistrital.module.bd.entities;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import udistrital.module.bd.entities.serializable.MensajeKey;

@Entity
@Table(name = "Mensaje")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Mensaje {
    
    @EmbeddedId
    private MensajeKey id;

    @ManyToOne
    @MapsId("idUsuario")
    @JoinColumn(name = "usuario")
    private Usuario usuario;

    @Column(name = "asunto")
    private String asunto;
    @Column(name = "cuerpomensaje",nullable = false)
    private String cuerpoMensaje;
    @Column(name = "fechaaccion",nullable = false)
    private Date fechaAccion;
    @Column(name = "horaaccion",nullable = false)
    private Time horaAccion;

    // Relaciones: 
    //ManyToOne: 
    @ManyToOne
    @JoinColumn(name = "idpais")
    private Pais pais;
    @ManyToOne
    @JoinColumn(name = "idtipocarpeta")
    @JsonManagedReference
    private TipoCarpeta tipoCarpeta;
    @ManyToOne
    @JsonManagedReference
    @JoinColumns
    ({
       @JoinColumn(name = "men_usuario",referencedColumnName = "usuario"),
       @JoinColumn(name = "men_idmensaje",referencedColumnName = "idMensaje")
    })
    private Mensaje mensajePadre;
    @ManyToOne
    @JsonManagedReference
    @JoinColumn(name = "idcategoria")
    private Categoria categoria;

    // OneToMany:
    @OneToMany(mappedBy = "mensajePadre")
    @JsonBackReference
    private List<Mensaje> respuestas;
    @OneToMany(mappedBy = "mensaje")
    @JsonBackReference
    private List<ArchivoAdjunto> archivosAjuntos;
    @OneToMany(mappedBy = "mensaje")
    @JsonBackReference
    private List<Destinatario> destinatarios;

}
